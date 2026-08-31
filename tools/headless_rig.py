# -*- coding: utf-8 -*-
# OPCG 헤드리스 듀얼 리그 — repo ocgcore.dll(32비트)로 실코어 듀얼을 GUI 없이 구동
# 용도: 카드 효과 실측(발동 프롬프트/판정), lua 프로브 주입(OCG_LoadScript) 디버깅
# 실행: 32비트 파이썬 필요 (python.org embeddable win32 zip이면 충분)
#   py32\python.exe tools\headless_rig.py
# 핵심 지식(2026-08-28 확립):
#  - 플래그 = DUEL_OPCG_MODE|DUEL_NO_MAIN_PHASE_2 = 0x2000200000 (헤드리스는 SCRIPTED_RPS 제외)
#  - OPCG 모드엔 배틀 페이즈가 없다: 어택 = MSG_SELECT_IDLECMD 응답 (idx<<16)|9 (커스텀 t=9,
#    IDLE 메시지 꼬리의 attackable 목록), 대상 선택 = MSG_SELECT_CARD(type0+size+idx u32)
#  - 리더 투입 = LOCATION_EXTRA, 시작 배치는 SELECT_PLACE(금지비트 파싱)
#  - 프로브: OCG_LoadScript로 임의 lua 주입(전 상태 접근). 단 게임 액션은 불가("Action is
#    not allowed here") — 액션은 EVENT_ADJUST 글로벌 이펙트의 operation으로 우회
#  - 검증 실적: OP17-039 지벡 어택시 트리거 실발화 확인(MSG_SELECT_EFFECTYN, 2026-08-28)
import ctypes as C, sqlite3, os, struct, sys, io
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')

REPO = r'C:\Users\정민혁\Documents\OPCG\optcg-repo'
SCRIPT = os.path.join(REPO, 'script')

core = C.CDLL(os.path.join(REPO, 'ocgcore.dll'))

class CardData(C.Structure):
    _fields_ = [('code', C.c_uint32), ('alias', C.c_uint32), ('setcodes', C.POINTER(C.c_uint16)),
                ('type', C.c_uint32), ('level', C.c_uint32), ('attribute', C.c_uint32),
                ('race', C.c_uint64), ('attack', C.c_int32), ('defense', C.c_int32),
                ('lscale', C.c_uint32), ('rscale', C.c_uint32), ('link_marker', C.c_uint32)]
class Player(C.Structure):
    _fields_ = [('startingLP', C.c_uint32), ('startingDrawCount', C.c_uint32), ('drawCountPerTurn', C.c_uint32)]
DataReader = C.CFUNCTYPE(None, C.c_void_p, C.c_uint32, C.POINTER(CardData))
DataReaderDone = C.CFUNCTYPE(None, C.c_void_p, C.POINTER(CardData))
ScriptReader = C.CFUNCTYPE(C.c_int, C.c_void_p, C.c_void_p, C.c_char_p)
LogHandler = C.CFUNCTYPE(None, C.c_void_p, C.c_char_p, C.c_int)
class DuelOptions(C.Structure):
    _fields_ = [('seed', C.c_uint64 * 4), ('flags', C.c_uint64), ('team1', Player), ('team2', Player),
                ('cardReader', DataReader), ('payload1', C.c_void_p),
                ('scriptReader', ScriptReader), ('payload2', C.c_void_p),
                ('logHandler', LogHandler), ('payload3', C.c_void_p),
                ('cardReaderDone', DataReaderDone), ('payload4', C.c_void_p),
                ('enableUnsafeLibraries', C.c_uint8)]
class NewCardInfo(C.Structure):
    _fields_ = [('team', C.c_uint8), ('duelist', C.c_uint8), ('code', C.c_uint32),
                ('con', C.c_uint8), ('loc', C.c_uint32), ('seq', C.c_uint32), ('pos', C.c_uint32)]

core.OCG_CreateDuel.restype = C.c_int
core.OCG_CreateDuel.argtypes = [C.POINTER(C.c_void_p), C.POINTER(DuelOptions)]
core.OCG_DuelNewCard.argtypes = [C.c_void_p, C.POINTER(NewCardInfo)]
core.OCG_StartDuel.argtypes = [C.c_void_p]
core.OCG_DuelProcess.restype = C.c_int
core.OCG_DuelProcess.argtypes = [C.c_void_p]
core.OCG_DuelGetMessage.restype = C.POINTER(C.c_uint8)
core.OCG_DuelGetMessage.argtypes = [C.c_void_p, C.POINTER(C.c_uint32)]
core.OCG_DuelSetResponse.argtypes = [C.c_void_p, C.c_void_p, C.c_uint32]
core.OCG_LoadScript.restype = C.c_int
core.OCG_LoadScript.argtypes = [C.c_void_p, C.c_char_p, C.c_uint32, C.c_char_p]

con = sqlite3.connect(os.path.join(REPO, 'cards-opcg.cdb'))
_keep = {}

@DataReader
def card_reader(payload, code, data):
    row = con.execute('select id,alias,setcode,type,atk,def,level,race,attribute from datas where id=?', (code,)).fetchone()
    d = data.contents
    if not row:
        d.code = 0; return
    d.code, d.alias = row[0], row[1]
    sc = row[2]; words = []
    while sc:
        w = sc & 0xFFFF
        if w: words.append(w)
        sc >>= 16
    arr = (C.c_uint16 * (len(words) + 1))(*(words + [0]))
    _keep[code] = arr
    d.setcodes = arr
    d.type, d.attack, d.defense = row[3], row[4], row[5]
    d.level, d.race, d.attribute = row[6], row[7], row[8]
    d.lscale = d.rscale = d.link_marker = 0

@DataReaderDone
def card_reader_done(payload, data):
    pass

@ScriptReader
def script_reader(payload, duel, name):
    fn = os.path.basename(name.decode())
    fp = os.path.join(SCRIPT, fn)
    if not os.path.exists(fp):
        print('  [script MISS]', fn)
        return 0
    data = open(fp, 'rb').read()
    return core.OCG_LoadScript(duel, data, len(data), name)

@LogHandler
def log_handler(payload, msg, t):
    print('  [corelog t=%d] %s' % (t, msg.decode('utf-8', 'replace')))

def inject(duel, lua_src, name='probe.lua'):
    b = lua_src.encode('utf-8')
    r = core.OCG_LoadScript(duel, b, len(b), name.encode())
    return r

def get_messages(duel):
    ln = C.c_uint32(0)
    p = core.OCG_DuelGetMessage(duel, C.byref(ln))
    raw = C.string_at(p, ln.value) if ln.value else b''
    out = []; i = 0
    while i + 4 <= len(raw):
        l = struct.unpack_from('<I', raw, i)[0]; i += 4
        out.append(raw[i:i+l]); i += l
    return out

def respond(duel, data):
    buf = C.create_string_buffer(data, len(data))
    core.OCG_DuelSetResponse(duel, buf, len(data))

def i32(v): return struct.pack('<i', v)

DEF_RESP = {10: i32(3), 11: i32(7), 12: i32(0), 13: i32(0), 14: i32(0),
            16: i32(-1), 19: i32(0x8), 20: i32(-1), 23: i32(-1), 26: i32(-1), 133: i32(1)}
retry = {}

def default_response(m):
    mid = m[0]
    if mid == 15 or mid == 26:  # SELECT_CARD류: 캔슬 시도, 반복 시 첫 장
        k = ('sc', m[:16])
        retry[k] = retry.get(k, 0) + 1
        if retry[k] > 2:
            return struct.pack('<iII', 0, 1, 0)
        return i32(-1)
    if mid == 18 or mid == 24:  # SELECT_PLACE/DISFIELD: 금지비트 피해서 첫 가용 자리
        import struct as _s
        player = m[1]
        flag = _s.unpack_from('<I', m, 3)[0]
        for base, loc in ((0, 0x4), (8, 0x8), (16, 0x4), (24, 0x8)):
            for seq in range(7):
                if not (flag >> (base + seq)) & 1:
                    pl = player if base < 16 else 1 - player
                    return bytes([pl, loc, seq])
        return bytes([player, 4, 0])
    return DEF_RESP.get(mid, i32(0))

def run(duel, steps, probe=None, probe_every=False, verbose=True):
    for step in range(steps):
        st = core.OCG_DuelProcess(duel)
        msgs = get_messages(duel)
        if verbose:
            ids = [m[0] for m in msgs if m]
            if ids: print('step %d status=%d msgs=%s' % (step, st, ids))
        if probe and (probe_every or step == steps - 1):
            inject(duel, probe)
        if st == 1:  # AWAITING
            if not msgs:
                print('AWAITING without msg??'); break
            req = msgs[-1]
            if req[0] == 1:  # MSG_RETRY: 직전 실요청 재응답(대안 시도)
                req = run.last_req if getattr(run, 'last_req', None) is not None else req
                run.retry_n = getattr(run, 'retry_n', 0) + 1
                if run.retry_n > 8:
                    print('RETRY 과다, 중단. last req id=', req[0], req[:24].hex()); break
            else:
                run.last_req = req; run.retry_n = 0
            r = default_response(req)
            if verbose: print('  -> respond msg %d with %s' % (req[0], r.hex()))
            respond(duel, r)
        elif st == 0:
            print('duel END at step', step); break
    return

def build(leader, deck_codes, flags=0x2000200000, seed=1):
    opts = DuelOptions()
    for i in range(4): opts.seed[i] = seed + i
    opts.flags = flags
    for t in (opts.team1, opts.team2):
        t.startingLP = 1; t.startingDrawCount = 0; t.drawCountPerTurn = 0
    opts.cardReader = card_reader; opts.scriptReader = script_reader
    opts.logHandler = log_handler; opts.cardReaderDone = card_reader_done
    opts.enableUnsafeLibraries = 1
    duel = C.c_void_p()
    st = core.OCG_CreateDuel(C.byref(duel), C.byref(opts))
    print('CreateDuel status =', st)
    assert st == 0
    for f in ('constant.lua', 'utility.lua'):
        data = open(os.path.join(SCRIPT, f), 'rb').read()
        r = core.OCG_LoadScript(duel, data, len(data), f.encode())
        print('load', f, '->', r)
    nci = NewCardInfo()
    for team in (0, 1):
        nci.team = nci.con = team; nci.duelist = 0; nci.pos = 0x8
        nci.loc = 0x40; nci.seq = 0; nci.code = leader
        core.OCG_DuelNewCard(duel, C.byref(nci))
        nci.loc = 0x01
        for code in deck_codes:
            nci.code = code
            core.OCG_DuelNewCard(duel, C.byref(nci))
    core.OCG_StartDuel(duel)
    print('StartDuel done')
    return duel

def run2(duel, steps, probe=None):
    turn = 0
    attacked = False
    for step in range(steps):
        st = core.OCG_DuelProcess(duel)
        msgs = get_messages(duel)
        for m in msgs:
            if m and m[0] == 110 and not attacked:
                attacked = True; print('  >>> 어택 발생!(MSG_ATTACK)')
            if m and m[0] == 40:
                turn += 1
                print('=== TURN', turn)
                if probe: inject(duel, probe)
        ids = [m[0] for m in msgs if m]
        if turn >= 3 and ids: print('step %d status=%d msgs=%s' % (step, st, ids))
        if attacked and ids:
            for m in msgs:
                if m and m[0] in (12, 13, 14, 15, 16, 23, 26):
                    print('   [attack-window req %d] %s' % (m[0], m[:48].hex()))
        if st == 1:
            if not msgs: print('AWAITING w/o msg'); break
            req = msgs[-1]
            if req[0] == 1:
                req = getattr(run2, 'last_req', req)
                run2.retry_n = getattr(run2, 'retry_n', 0) + 1
                if run2.retry_n > 8:
                    print('RETRY 과다. req=', req[0], req[:24].hex()); break
            else:
                run2.last_req = req; run2.retry_n = 0
            mid = req[0]
            if mid == 11 and turn >= 3 and not getattr(run2, 'dumped', False):
                run2.dumped = True
                print('   [IDLE raw]', req.hex())
            if mid == 11:  # IDLE: OPCG는 BP 없음 — 어택=활성화(5) 항목
                rich = len(req) > 24
                want_atk = turn >= 3 and not attacked and getattr(run2, 'retry_n', 0) < 3 and rich
                if want_atk:
                    r = i32((0 << 16) | 9)
                else:
                    r = i32(7)
            elif mid == 10:  # BATTLECMD(안 옴 예상 — OPCG는 IDLE 활성화)
                r = i32(3)
            else:
                r = default_response(req)
            if turn >= 3: print('  -> respond %d: %s' % (mid, r.hex()))
            respond(duel, r)
        elif st == 0:
            print('duel END'); break

if __name__ == '__main__':
    LEADER = 880002745        # OP17-039 록스 D. 지벡
    FILLER = 880002712        # OP17-006 킹듀(바닐라)
    ROCKS  = 880002751        # OP17-045 쿄(록스 특징 — on_match용)
    deck = [FILLER] * 30 + [ROCKS] * 20
    duel = build(LEADER, deck)
    PROBE = '''
local ok, err = pcall(function()
  local l0 = opcg and opcg.GetLeader and opcg.GetLeader(0)
  if not l0 then Debug.Message("PROBE: no leader yet") return end
  Debug.Message("PROBE: leader0="..tostring(l0:GetOriginalCode()).." loc="..tostring(l0:GetLocation()))
  if not (opcg.runtime and opcg.runtime.can_resolve) then Debug.Message("PROBE: no runtime") return end
  local ok1, why = opcg.runtime.can_resolve(l0, "E1", { card=l0, player=0, timing="WHEN_ATTACKING" })
  Debug.Message("PROBE can_resolve E1 = "..tostring(ok1).." why="..tostring(why))
end)
if not ok then Debug.Message("PROBE ERROR: "..tostring(err)) end
'''
    PROBE2 = '''
local ok, err = pcall(function()
  local l0 = opcg and opcg.GetLeader and opcg.GetLeader(0)
  if not l0 then Debug.Message("P: no leader") return end
  if not _G.__probe_drew then
    _G.__probe_drew = true
    local e = Effect.GlobalEffect()
    e:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
    e:SetCode(EVENT_ADJUST)
    e:SetOperation(function(ge)
      for p = 0, 1 do
        if Duel.GetFieldGroupCount(p, LOCATION_HAND, 0) < 2
          and Duel.GetFieldGroupCount(p, LOCATION_DECK, 0) > 10 then
          Duel.Draw(p, 3, REASON_RULE)
        end
      end
    end)
    Duel.RegisterEffect(e, 0)
  end
  local hand = Duel.GetFieldGroupCount(0, LOCATION_HAND, 0)
  local ok1, why = opcg.runtime.can_resolve(l0, "E1", { card=l0, player=0, timing="WHEN_ATTACKING" })
  local reg = l0.IsHasEffect and (l0:IsHasEffect(EVENT_ATTACK_ANNOUNCE) and "Y" or "N") or "?"
  Debug.Message("P: hand="..hand.." can_resolve="..tostring(ok1).." why="..tostring(why).." collector="..reg)
end)
if not ok then Debug.Message("P ERR: "..tostring(err)) end
'''
    run2(duel, 400, probe=PROBE2)
