-- AUTO-GENERATED: EB04-010 / 루루시아 왕국
-- rules_id=EB04-010 script_id=880002431 fingerprint=83d1734586fb58e8247e64105212f0a7cb88d6c1742e327c7405b1902c860eb3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-010]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=5000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=0,
              filter={
                base_cost_eq=1,
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】자신의 원래 코스트 1인 모든 캐릭터의 파워 +5000.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[SET_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            value=0,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 캐릭터 1장까지는 이번 턴 동안 파워가 0이 된다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-010]],
    schema_version=1,
  })
end
