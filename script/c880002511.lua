-- AUTO-GENERATED PROMO: P-092 / 코비
-- rules_id=P-092 script_id=880002511
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-092]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-3000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】이 캐릭터의 파워 -3000.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[SET_BASE_POWER]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            value=7000,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[해군]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 리더가 《해군》 특징을 가진 경우, 다음 상대의 턴 종료 시까지, 자신의 리더의 원래 파워를 7000으로 한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[P-092]],
    schema_version=1,
  })
end
