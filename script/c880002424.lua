-- AUTO-GENERATED: EB04-003 / 스모커 & 타시기
-- rules_id=EB04-003 script_id=880002424 fingerprint=b9dc9b82207097b3eb615751383a562235c7d2e3ca414435ece38f7ea0021297
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[SET_BASE_POWER]],
            selector={
              count=1,
              filter={
                trait=[[해군]],
              },
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            value=7000,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】자신의 《해군》 특징을 가진 리더의 원래 파워를 7000으로 한다.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
    },
    keywords={
      [[RUSH]],
    },
    rules_id=[[EB04-003]],
    schema_version=1,
  })
end
