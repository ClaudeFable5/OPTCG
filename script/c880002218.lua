-- AUTO-GENERATED: OP14-053 / 비스타
-- rules_id=OP14-053 script_id=880002218 fingerprint=0f9a9bc4814356f1810d7ba1cb0343db2b1e93f8e922212bbd480ea1aac2afde
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-053]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[SET_BASE_POWER_FROM_TARGET]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            source_selector={
              count=1,
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=7,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】자신의 패가 7장 이하인 경우, 이 캐릭터의 원래 파워는 자신의 리더의 원래 파워와 같은 파워가 된다.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP14-053]],
    schema_version=1,
  })
end
