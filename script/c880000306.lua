-- AUTO-GENERATED: OP02-061 / 몰리
-- rules_id=OP02-061 script_id=880000306 fingerprint=5466605558104f02c1e3e52e24d5c02c70e95d65adbc54a5d720d4e180587eeb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-061]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_BATTLE]],
            filter={
              cost_lte=5,
            },
            op=[[PREVENT_BLOCKER_ACTIVATION]],
            player=[[OPPONENT]],
          },
        },
        conditions={
          {
            count=1,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 패가 1장 이하인 경우, 이번 배틀 동안, 상대는 코스트 5 이하인 캐릭터의 【블로커】를 발동할 수 없다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-061]],
    schema_version=1,
  })
end
