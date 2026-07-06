-- AUTO-GENERATED: OP02-052 / 캐버디
-- rules_id=OP02-052 script_id=880000297 fingerprint=a52925a863d586daffce8716f7a634c01c504aad443424b44470fa6f580c19bd
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-052]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            filter={
              name=[[모디]],
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 「모디」가 있을 경우, 카드를 2장 뽑고 자신의 패 1장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-052]],
    schema_version=1,
  })
end
