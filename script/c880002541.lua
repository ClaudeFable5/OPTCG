-- MANUAL: ST30-001 / 루피 & 에이스 (2026-08-04 ST-30 신규 세트 수동 이식)
-- EN(series 569030)/JP(series 550030) 공식 카드리스트 기준, ST29 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST30-001]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            amount=-2000,
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
        conditions={
          {
            filter={
              base_power_gte=7000,
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 원래 파워 7000 이상인 캐릭터가 있을 경우, 이 리더의 파워 -2000.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            amount=3000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              filter={
                name=[[포트거스 D. 에이스]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
          {
            amount=3000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              filter={
                name=[[몽키 D. 루피]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】자신의 「포트거스 D. 에이스」와 「몽키 D. 루피」 전부는 파워 +3000.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST30-001]],
    schema_version=1,
  })
end
