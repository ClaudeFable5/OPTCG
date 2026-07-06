-- AUTO-GENERATED: OP02-016 / 마구라
-- rules_id=OP02-016 script_id=880000260 fingerprint=b7f4637f287729ec87e5c368a8387153ff39db9b9ac7a2757ca75a07270711c5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-016]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                color=[[RED]],
                cost_eq=1,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】이번 턴 동안, 자신의 코스트 1인 적색 캐릭터 1장까지의 파워 +3000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-016]],
    schema_version=1,
  })
end
