-- AUTO-GENERATED: OP01-052 / 라이조
-- rules_id=OP01-052 script_id=880000175 fingerprint=4d87c75372258f09fd7229812051476cce13c42c1b8d2defc0aceeef0e39df8f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-052]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            count=2,
            op=[[CHARACTER_COUNT_GTE]],
            player=[[YOU]],
            state=[[RESTED]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【어택 시】【턴 1회】자신의 레스트 상태인 캐릭터가 2장 이상인 경우, 카드를 1장 뽑는다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-052]],
    schema_version=1,
  })
end
