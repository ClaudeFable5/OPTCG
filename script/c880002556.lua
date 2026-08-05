-- MANUAL: ST30-016 / 아직 싸울 수 있냐 루피!? 당연하지!!! (2026-08-04 ST-30 신규 세트 수동 이식)
-- EN(series 569030)/JP(series 550030) 공식 카드리스트 기준, ST29 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST30-016]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
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
                filter={
                  base_power_eq=6000,
                  name=[[포트거스 D. 에이스]],
                },
                op=[[CHARACTER_EXISTS]],
                player=[[YOU]],
              },
              {
                filter={
                  base_power_eq=6000,
                  name=[[몽키 D. 루피]],
                },
                op=[[CHARACTER_EXISTS]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】자신의 리더나 캐릭터 1장까지는 이번 배틀 동안 파워 +3000. 그 후, 자신의 원래 파워 6000인 캐릭터 「포트거스 D. 에이스」와 「몽키 D. 루피」가 있을 경우, 카드를 1장 뽑는다.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST30-016]],
    schema_version=1,
  })
end
