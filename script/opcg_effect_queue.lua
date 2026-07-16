-- ONE PIECE CARD GAME auto-effect queue.
--
-- EDOPro normally builds a YGO chain and resolves it backwards. OPCG instead
-- resolves one auto effect at a time. Effects whose timing is fulfilled
-- together are grouped by generation: the turn player's generation resolves
-- first, then the non-turn player's. Effects produced while resolving an item
-- are placed in the next generation.
--
-- This is a modernized, scoped successor to the 2021 VanguardEventTable
-- prototype in legacy.txt. It deliberately does not monkey-patch
-- Card.RegisterEffect.
opcg = opcg or {}
opcg.effect_queue = opcg.effect_queue or {}

local Q = opcg.effect_queue

Q.EVENT_RESOLVE = Q.EVENT_RESOLVE or ((EVENT_CUSTOM or 0x10000000) + 0x0f101)
Q._items = Q._items or {}
Q._serial = Q._serial or 0
Q._installed = Q._installed or false
Q._flushing = false
Q._active_item = nil
Q._last_generation = Q._last_generation or 0
Q._inflight = Q._inflight or nil
Q._resolvers = Q._resolvers or setmetatable({}, {__mode = "k"})
Q._timing_resolvers = Q._timing_resolvers or setmetatable({}, {__mode = "k"})
Q._direct_items = Q._direct_items or {}
Q._direct_serial = Q._direct_serial or 0
Q._direct_active = nil
Q._direct_draining = false

local function turn_player()
	if Duel and Duel.GetTurnPlayer then return Duel.GetTurnPlayer() end
	return 0
end

local function current_chain()
	if Duel and Duel.GetCurrentChain then return Duel.GetCurrentChain() end
	return 0
end

local function shallow_copy(value)
	local result = {}
	for key, item in pairs(value or {}) do result[key] = item end
	return result
end

local function clone_event_group(group)
	if group and group.Clone then return group:Clone() end
	return group
end

local function find_index(serial, resolver)
	for index, item in ipairs(Q._items) do
		if item.serial == serial and (resolver == nil or item.resolver == resolver) then
			return index, item
		end
	end
	return nil, nil
end

local function minimum_generation()
	local result
	for _, item in ipairs(Q._items) do
		if result == nil or item.generation < result then result = item.generation end
	end
	return result
end

local function generation_has_player(generation, player)
	for _, item in ipairs(Q._items) do
		if item.generation == generation and item.player == player then return true end
	end
	return false
end

local function eligible_bucket()
	local generation = minimum_generation()
	if generation == nil then return nil, nil end
	local tp = turn_player()
	if generation_has_player(generation, tp) then return generation, tp end
	return generation, 1 - tp
end

-- 총합룰 8-6-1: within a bucket the owner picks the order. Multi-card
-- buckets go through the choose_next_direct prompt below; effects of one
-- same card fall back to insertion order (= printed order on the card).

local function description_for(card, effect, index)
	if type(effect.description) == "number" then return effect.description end
	-- EDOPro system string 222: "Activate a Trigger Effect?"
	return 222
end

local function source_says_optional(source)
	source = source or ""
	for _, marker in ipairs({
		"may ", "can ", "you may", "you can",
		"できる", "してもよい", "할 수", "해도 된다", "수 있다",
	}) do
		if source:find(marker, 1, true) then return true end
	end
	return false
end

function Q.is_optional(effect)
	if effect.optional ~= nil then return effect.optional == true end
	if effect.mandatory ~= nil then return effect.mandatory ~= true end
	-- An activation cost can always be declined by choosing not to pay it.
	if #(effect.costs or {}) > 0 then return true end
	return source_says_optional(effect.source_text)
end

function Q.pending_count()
	return #Q._items
end

function Q.snapshot()
	local result = {}
	for _, item in ipairs(Q._items) do
		result[#result + 1] = {
			serial=item.serial,
			player=item.player,
			generation=item.generation,
			effect_id=item.effect and item.effect.effect_id,
			raised=item.raised,
		}
	end
	return result
end

function Q.reset()
	Q._items = {}
	Q._serial = 0
	Q._flushing = false
	Q._active_item = nil
	Q._inflight = nil
	Q._last_generation = 0
	Q._direct_items = {}
	Q._direct_serial = 0
	Q._direct_active = nil
	Q._direct_draining = false
end

function Q.enqueue(card, effect, resolver, context, options)
	options = options or {}
	context = shallow_copy(context)
	if options.timing ~= nil then context.timing = options.timing end
	Q._serial = Q._serial + 1
	local generation
	if Q._active_item then
		generation = Q._active_item.generation + 1
	elseif #Q._items == 0 then
		generation = 0
	else
		generation = minimum_generation() or Q._last_generation
	end
	local item = {
		serial=Q._serial,
		card=card,
		effect=effect,
		resolver=resolver,
		player=context.player == nil and card:GetControler() or context.player,
		generation=generation,
		context=context,
		optional=options.optional == nil and Q.is_optional(effect) or options.optional,
		description=options.description or 0,
		raised=false,
	}
	Q._items[#Q._items + 1] = item
	return item
end

function Q.take(serial, resolver)
	local index, item = find_index(serial, resolver)
	if not index then return nil end
	table.remove(Q._items, index)
	if Q._inflight == serial then
		Q._inflight = nil
	end
	return item
end

-- 총합룰 8-6-1: 같은 플레이어의 동시 트리거는 그 플레이어가 처리 순서를
-- 정한다. 서로 다른 카드가 2장 이상 대기 중이면 매 처리마다 "다음 카드"를
-- 표준 카드 선택창으로 묻는다(메인/배틀 공통 — 공식룰에 리더 우선 규정은
-- 없다). 같은 카드의 복수 효과는 카드 클릭으로 구분할 수 없으므로 삽입순
-- (= 카드 기재순) 폴백. 순서 선택은 발동 여부와 무관: 강제 아이템은 어떤
-- 순서로 골라도 발동 단계에서 예/아니오 없이 그대로 소화된다.
local function choose_next_direct(player, candidates)
	if not (Group and Group.CreateGroup) then return nil end
	local group = Group.CreateGroup()
	local first_by_card = {}
	for _, item in ipairs(candidates) do
		local card = item.card
		if card then
			group:AddCard(card)
			if not first_by_card[card] or item.serial < first_by_card[card].serial then
				first_by_card[card] = item
			end
		end
	end
	if group:GetCount() < 2 then return nil end
	if Duel.Hint and HINT_SELECTMSG then
		local hint = aux and aux.Stringid and aux.Stringid(879999999, 8) or 560
		Duel.Hint(HINT_SELECTMSG, player, hint)
	end
	local picked = group:Select(player, 1, 1, nil)
	local card = picked and picked:GetFirst() or nil
	return card and first_by_card[card] or nil
end

function Q.flush()
	if Q._flushing or #Q._items == 0 or current_chain() > 0 then return false end
	if Q._inflight ~= nil then return false end
	local generation, player = eligible_bucket()
	if generation == nil then return false end
	Q._flushing = true
	-- 8-6-1-1: 같은 (세대, 플레이어) 버킷에 서로 다른 카드가 2장 이상 대기
	-- 중이면 어떤 것을 먼저 체인에 올릴지 그 플레이어가 고른다 - 발동(raise)
	-- 직전 선택. 한 카드의 복수 효과는 삽입순(기재순) 폴백.
	local bucket = {}
	for _, item in ipairs(Q._items) do
		if item.generation == generation and item.player == player and not item.raised then
			bucket[#bucket + 1] = item
		end
	end
	local selected = bucket[1]
	if #bucket >= 2 then
		selected = choose_next_direct(player, bucket) or selected
	end
	if selected then
		selected.raised = true
		Q._inflight = selected.serial
		if Duel and Duel.RaiseSingleEvent then
			-- 시간의 신의 문법: 재발신 후 프로세서에 양보한다(RaiseSingleEvent
			-- 자체가 process_single_event+yield). 강제 수집은 없다 — PPE
			-- 실호출 0(도구로만 존치). 후보가 사는 조건 = 이 raise 뒤 코어가
			-- 스스로 수집 지점을 밟는 문맥일 것: 체인 종료(after_chain 경유,
			-- zephyr 실측)·페이즈 처리 내부(YOUR_TURN_END류)·소환 직후
			-- (ON_PLAY류). 그 밖의 무수집 문맥은 게이트가 애초에 direct로
			-- 보내므로 여기 도달하지 않는다.
			Duel.RaiseSingleEvent(selected.card, Q.EVENT_RESOLVE, selected.resolver,
				0, player, player, selected.serial)
		end
	end
	Q._flushing = false
	return selected ~= nil
end

function Q.after_chain()
	-- inflight 좀비 회수: raise된 리졸버가 체인 오퍼를 못 받고 증발하면
	-- (어택 문맥 등) 소비가 없어 _inflight가 영구 잔존, flush가 게임 끝까지
	-- 마비된다. 아이템이 아직 _items에 남아있는 미소비 inflight만 해제 —
	-- 정상 소비 직후라면 take가 이미 nil로 만들었으니 건드릴 일이 없다.
	if Q._inflight ~= nil then
		for _, item in ipairs(Q._items) do
			if item.serial == Q._inflight then
				Q._inflight = nil
				break
			end
		end
	end
	for _, item in ipairs(Q._items) do item.raised = false end
	Q._in_after_chain = true
	Q.flush()
	Q._in_after_chain = false
	-- triggers born during the finished chain (battle KO, effect KO) wait in
	-- the direct queue: resolve them now, right after the resolution that
	-- spawned them (rule 8-6-3)
	if not Q._direct_draining and #Q._direct_items > 0 then
		Q.drain_direct({}, nil, {})
	end
end

function Q.install()
	if Q._installed then return true end
	Q._installed = true
	if not Effect or not Effect.GlobalEffect or not Duel or not Duel.RegisterEffect then
		return true
	end
	local watcher = Effect.GlobalEffect()
	watcher:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
	watcher:SetCode(EVENT_CHAIN_END)
	watcher:SetOperation(function() Q.after_chain() end)
	Duel.RegisterEffect(watcher, 0)
	return true
end

local function make_context(card, tp, eg, ep, ev, re, r, rp)
	local context = {
		card=card,
		player=card:GetControler(),
		turn_id=Duel.GetTurnCount and Duel.GetTurnCount() or 0,
		event_group=clone_event_group(eg),
		event_player=ep,
		event_value=ev,
		reason_effect=re,
		reason=r,
		reason_player=rp,
		collecting_player=tp,
	}
	if context.event_group and context.event_group.GetFirst then
		context.event_target = context.event_group:GetFirst()
	end
	return context
end

local function resolver_key(effect)
	if effect and effect.effect_id ~= nil then return effect.effect_id end
	return effect
end

local function remember_timing_resolver(card, effect, timing, resolver)
	if not (card and effect and timing and resolver) then return end
	local by_timing = Q._timing_resolvers[card]
	if not by_timing then
		by_timing = {}
		Q._timing_resolvers[card] = by_timing
	end
	local by_effect = by_timing[timing]
	if not by_effect then
		by_effect = {}
		by_timing[timing] = by_effect
	end
	by_effect[resolver_key(effect)] = resolver
end

local function timing_resolver(card, effect, timing)
	local by_timing = Q._timing_resolvers[card]
	if not by_timing then return nil end
	local by_effect = by_timing[timing]
	if not by_effect then return nil end
	return by_effect[resolver_key(effect)]
end

local function create_resolver(card, effect, description_index)
	Q.install()
	local resolver = Effect.CreateEffect(card)
	resolver:SetType(EFFECT_TYPE_SINGLE + EFFECT_TYPE_TRIGGER_F)
	resolver:SetCode(Q.EVENT_RESOLVE)
	-- 리더존/스테이지 등 어느 위치에서든 발동 가능해야 한다(레인지 미설정
	-- 리졸버는 위치 게이트에서 후보 소거될 수 있다 - 쿠잔 리더 실측).
	resolver:SetRange(0xff)
	-- 시간의 신의 문법(legacy 원형): 플래그 없는 평범한 유발효과. DELAY를 달면
	-- 후보가 지연발동 레지스트리(별도 소비 규칙)로 흘러 자연 수집에서 죽는다
	-- (무체인 raise 증발·체인 후 연쇄 사망의 유력 원인으로 실측 특정 - 아래
	-- 회귀가 판정). 우리 raise는 flush의 체인 가드 덕에 항상 소비 가능한
	-- 순간(체인 밖)에만 나가므로 타이밍 소실 보호가 필요 없다.
	resolver:SetProperty(EFFECT_FLAG_DAMAGE_STEP + EFFECT_FLAG_DAMAGE_CAL)
	local description = description_for(card, effect, description_index)
	if description ~= 0 then resolver:SetDescription(description) end
	resolver:SetCondition(function(e, _, _, _, ev, re)
		local _, item = find_index(ev, e)
		return re == e and item ~= nil
	end)
	resolver:SetTarget(function(e, _, _, _, ev, _, _, _, check)
		if check == 0 then
			local _, item = find_index(ev, e)
			return item ~= nil
		end
		-- One OPCG effect resolves before the next effect may activate.
		Duel.SetChainLimit(aux.FALSE)
	end)
	resolver:SetOperation(function(e, player, _, _, ev)
		local item = Q.take(ev, e)
		if not item then return end
		Q._last_generation = item.generation
		local previous = Q._active_item
		Q._active_item = item
		local context = item.context
		context.player = item.player
		context.timing = context.timing or item.timing
		local can_resolve = opcg.runtime.can_resolve(item.card,
			item.effect.effect_id, context)
		local accepted = can_resolve
		if accepted and item.optional then
			if Duel.SelectEffectYesNo and item.card
				and (item.description == 0 or item.description == 222) then
				accepted = Duel.SelectEffectYesNo(player, item.card)
			else
				accepted = Duel.SelectYesNo(player, item.description)
			end
		end
		if accepted then
			opcg.runtime.resolve(item.card, item.effect.effect_id, context)
		end
		Q._active_item = previous
	end)
	Q._resolvers[resolver] = true
	card:RegisterEffect(resolver)
	return resolver, description
end

function Q.register_trigger(card, effect, code, options)
	options = options or {}
	local resolver, description = create_resolver(card, effect, options.description_index)
	remember_timing_resolver(card, effect, options.timing, resolver)

	local collector = Effect.CreateEffect(card)
	local field = options.field == true
	collector:SetType((field and EFFECT_TYPE_FIELD or EFFECT_TYPE_SINGLE)
		+ EFFECT_TYPE_CONTINUOUS)
	collector:SetCode(code)
	if options.range then collector:SetRange(options.range) end
	if options.target_range then
		collector:SetTargetRange(options.target_range[1], options.target_range[2])
	end
	if options.condition then collector:SetCondition(options.condition) end
	if options.target then collector:SetTarget(options.target) end
	collector:SetOperation(function(e, tp, eg, ep, ev, re, r, rp)
		local handler = e:GetHandler()
		-- Phase events re-collect continuous effects until none is activateable:
		-- a collector on such an event must consume its one shot per turn or the
		-- phase never ends. The registrant's condition checks the same label.
		if options.once_per_turn then
			if e:GetLabel() == Duel.GetTurnCount() then return end
			e:SetLabel(Duel.GetTurnCount())
		end
		local context = make_context(handler, tp, eg, ep, ev, re, r, rp)
		if options.context then
			context = options.context(e, tp, eg, ep, ev, re, r, rp, context) or context
		end
		if options.timing ~= nil then context.timing = options.timing end
		local ok = opcg.runtime.can_resolve(handler, effect.effect_id, context)
		if not ok then return end
		-- [문법 게이트 — 극성 교정] 체인 진행 중(비배틀·비드레인) 파생은
		-- 엔진이 정답이다: enqueue만 해두면 flush가 체인 중엔 대기하고
		-- (flush 첫 줄), CHAIN_END의 after_chain이 재발신 → 무-DELAY
		-- 리졸버를 코어 자연 수집이 집어 네이티브 발동(판정·연출·음)을
		-- 준다(zephyr 실측, f9c89d1). 종전 "엔진 = 지연 체인 강등으로 영영
		-- 미해결" 서사는 코덱스 원본 EFFECT_FLAG_DELAY 시절의 실측 화석
		-- (반성문 판결 참조) — 극성이 X.emit 게이트와 정반대로 남아 있었다.
		-- 배틀 특별취급 없음: 어택은 네이티브 — raise하면 코어 배틀 창이
		-- 수집한다. direct는 진행 중 드레인 내부뿐.
		if Q.is_draining() then
			Q.enqueue_direct(handler, effect, context, {
				optional=options.optional,
				description=description,
				timing=options.timing,
			})
			return
		end
		Q.enqueue(handler, effect, resolver, context, {
			optional=options.optional,
			description=description,
			timing=options.timing,
		})
		Q.flush()
	end)
	card:RegisterEffect(collector)
	return collector, resolver
end

function Q.register_semantic(card, effect, timing, options)
	options = options or {}
	local resolver = timing_resolver(card, effect, timing)
	if resolver then return resolver end
	resolver = create_resolver(card, effect, options.description_index)
	remember_timing_resolver(card, effect, timing, resolver)
	return resolver
end

local function timing_matches(effect, timing)
	for _, value in ipairs(effect.timings or {}) do
		if value == timing then return true end
	end
	return false
end

local function each_card(cards, callback)
	if not cards then return end
	if cards.GetFirst then
		local card = cards:GetFirst()
		while card do
			callback(card)
			card = cards:GetNext()
		end
		return
	end
	for _, card in ipairs(cards) do callback(card) end
end

local function direct_minimum_generation()
	local result
	for _, item in ipairs(Q._direct_items) do
		if result == nil or item.generation < result then result = item.generation end
	end
	return result
end

local function direct_bucket()
	local generation = direct_minimum_generation()
	if generation == nil then return nil, nil, {} end
	local tp = turn_player()
	local player = 1 - tp
	for _, item in ipairs(Q._direct_items) do
		if item.generation == generation and item.player == tp then
			player = tp
			break
		end
	end
	local result = {}
	for _, item in ipairs(Q._direct_items) do
		if item.generation == generation and item.player == player then
			result[#result + 1] = item
		end
	end
	table.sort(result, function(left, right)
		return left.serial < right.serial
	end)
	return generation, player, result
end

-- [OPCG] 대기열 가시화: 직접 큐가 변할 때마다 CLEAR(212) + 아이템당 PUSH(210)
-- 힌트를 흘려 클라가 LP 프레임 아래 썸네일 스트립을 그린다. 표시 전용 채널
-- (MSG_HINT, 코어 무수정)이라 게임 상태/리플레이 재현에 영향 없다.
-- PUSH: player=컨트롤러, value=code | (임의발동이면 2^32).
local function sync_queue_display()
	if not (Duel and Duel.Hint) then return end
	Duel.Hint(212, 0, 0)
	for _, item in ipairs(Q._direct_items) do
		local code = 0
		if item.card and item.card.GetOriginalCode then code = item.card:GetOriginalCode() end
		Duel.Hint(210, item.player or 0, code + (item.optional and 4294967296 or 0))
	end
end

local function remove_direct(item)
	for index, candidate in ipairs(Q._direct_items) do
		if candidate == item then
			table.remove(Q._direct_items, index)
			sync_queue_display()
			return true
		end
	end
	return false
end

function Q.has_timing(card, timing, context)
	if not opcg.runtime or not opcg.runtime.get_definition then return false end
	local definition = opcg.runtime.get_definition(card)
	if not definition then return false end
	for _, effect in ipairs(definition.effects or {}) do
		if timing_matches(effect, timing) then
			local item_context = shallow_copy(context)
			item_context.card = card
			item_context.player = item_context.player == nil and card:GetControler()
				or item_context.player
			item_context.timing = timing
			if opcg.runtime.can_resolve(card, effect.effect_id, item_context) then
				return true
			end
		end
	end
	return false
end

function Q.direct_pending_count()
	return #Q._direct_items
end

-- true while an effect is being resolved through the direct queue (battle
-- dispatches, triggers): events emitted now belong to the NEXT direct
-- generation, not to the engine path (which could only run at chain end).
function Q.is_draining()
	return Q._direct_draining == true
end

-- Enqueue ONE effect straight into the direct bucket. Used by trigger
-- collectors that fire while a direct drain is already running: the ambient
-- drain picks the item up at its 8-6 boundary.
function Q.enqueue_direct(card, effect, context, options)
	options = options or {}
	Q._direct_serial = Q._direct_serial + 1
	local generation = Q._direct_active and (Q._direct_active.generation + 1) or 0
	local item = {
		serial=Q._direct_serial,
		card=card,
		effect=effect,
		player=context.player or card:GetControler(),
		generation=generation,
		context=context,
		optional=options.optional == nil and Q.is_optional(effect) or options.optional,
		description=options.description or 0,
		timing=options.timing or context.timing,
	}
	Q._direct_items[#Q._direct_items + 1] = item
	sync_queue_display()
	return item
end

function Q.enqueue_timing(cards, timing, context, options)
	context = context or {}
	options = options or {}
	local enqueued = {}

	each_card(cards, function(card)
		local definition = opcg.runtime and opcg.runtime.get_definition
			and opcg.runtime.get_definition(card)
		if not definition then return end
		for _, effect in ipairs(definition.effects or {}) do
			if timing_matches(effect, timing) then
				local item_context = shallow_copy(context)
				item_context.card = card
				item_context.player = card:GetControler()
				item_context.timing = timing
				if opcg.runtime.can_resolve(card, effect.effect_id, item_context) then
					local resolver = options.engine
						and timing_resolver(card, effect, timing) or nil
					if resolver then
						enqueued[#enqueued + 1] = Q.enqueue(card, effect, resolver,
							item_context, {
								optional=options.optional,
								description=description_for(card, effect,
									options.description_index or 0),
								timing=timing,
							})
					elseif not options.engine or options.fallback_direct then
						Q._direct_serial = Q._direct_serial + 1
						local generation = Q._direct_active
							and (Q._direct_active.generation + 1) or 0
						local item = {
							serial=Q._direct_serial,
							card=card,
							effect=effect,
							player=item_context.player,
							generation=generation,
							context=item_context,
							optional=Q.is_optional(effect),
							description=description_for(card, effect,
								options.description_index or 0),
							timing=timing,
						}
						Q._direct_items[#Q._direct_items + 1] = item
						enqueued[#enqueued + 1] = item
					end
				end
			end
		end
	end)

	if #enqueued > 0 then sync_queue_display() end
	return enqueued
end

local function resolve_direct_item(selected, options, context, resolved)
	local player = selected.player
	selected.context.timing = selected.context.timing or selected.timing

	local accepted = opcg.runtime.can_resolve(selected.card,
		selected.effect.effect_id, selected.context)
	if accepted and selected.optional then
		if options.choose_optional then
			accepted = options.choose_optional(player, selected) == true
		elseif Duel and Duel.SelectEffectYesNo and selected.card
			and (selected.description == 0 or selected.description == 222) then
			-- generic prompt: anchor it to the source card so the player can
			-- see WHOSE effect is asking (a bare string 222 reads as noise)
			accepted = Duel.SelectEffectYesNo(player, selected.card)
		elseif Duel and Duel.SelectYesNo then
			accepted = Duel.SelectYesNo(player, selected.description)
		end
	end

	local record = {
		serial=selected.serial,
		card=selected.card,
		effect_id=selected.effect.effect_id,
		player=selected.player,
		generation=selected.generation,
		accepted=accepted == true,
		timing=selected.timing,
	}
	resolved[#resolved + 1] = record
	if accepted then
		if options.before_resolve
			and options.before_resolve(player, selected, selected.context or context) == false then
			accepted = false
			record.accepted = false
			record.reason = "ACTIVATION_ABORTED"
		end
	end
	if accepted then
		local previous = Q._direct_active
		Q._direct_active = selected
		if options.prevalidated and opcg.runtime.resolve_prevalidated then
			record.ok, record.result = opcg.runtime.resolve_prevalidated(
				selected.card, selected.effect.effect_id, selected.context)
		else
			record.ok, record.result = opcg.runtime.resolve(selected.card,
				selected.effect.effect_id, selected.context)
		end
		Q._direct_active = previous
	end
	return record
end

function Q.drain_direct(options, timing, context)
	options = options or {}
	context = context or {}
	if Q._direct_draining then return {} end
	Q._direct_draining = true
	local resolved = {}

	while #Q._direct_items > 0 do
		local _, player, candidates = direct_bucket()
		if #candidates == 0 then break end
		local selected = candidates[1]
		if options.choose_item then
			local choice = options.choose_item(player, candidates, timing, context)
			if type(choice) == "number" then selected = candidates[choice] or selected
			elseif choice then selected = choice end
		elseif #candidates >= 2 then
			selected = choose_next_direct(player, candidates) or selected
		end
		remove_direct(selected)
		resolve_direct_item(selected, options, context, resolved)
	end

	Q._direct_draining = false
	return resolved
end

function Q.resolve_timing(cards, timing, context, options)
	context = context or {}
	options = options or {}
	local enqueued = Q.enqueue_timing(cards, timing, context, options)
	if options.engine then
		if not options.defer then Q.flush() end
		return enqueued, {}
	end
	if options.immediate then
		-- 총합룰 8-6-2-1: a [Trigger] interrupts the damage processing and
		-- resolves on the spot, even when that damage came from an effect
		-- that is itself resolving inside drain_direct. Only the items
		-- enqueued HERE resolve now; anything they spawn stays queued
		-- (8-6-2: met-during-damage timings wait for the processing to end).
		local resolved = {}
		local draining_before = Q._direct_draining
		Q._direct_draining = true
		for _, item in ipairs(enqueued) do
			remove_direct(item)
			resolve_direct_item(item, options, context, resolved)
		end
		Q._direct_draining = draining_before
		return enqueued, resolved
	end
	if options.defer or Q._direct_draining then return enqueued, {} end
	local resolved = Q.drain_direct(options, timing, context)
	return enqueued, resolved
end

return Q
