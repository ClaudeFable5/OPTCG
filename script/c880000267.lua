-- AUTO-GENERATED: OP02-023 / 못난 아들을, 그래도 사랑 하겠다...
-- rules_id=OP02-023 script_id=880000267 fingerprint=1a241a92ab10a9e0a033dea8a04d89ea3495f5d221c8bf7f259aa073ddb8c9f9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-023]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[CANNOT_TAKE_LIFE_TO_HAND]],
            player=[[YOU]],
            reason=[[SELF_EFFECT]],
          },
        },
        conditions={
          {
            count=3,
            op=[[LIFE_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 라이프가 3장 이하인 경우, 이번 턴 동안, 자신은 자신의 효과로 라이프를 패에 더할 수 없다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이번 턴 동안, 자신의 리더 1장까지의 파워 +1000.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-023]],
    schema_version=1,
  })
end
