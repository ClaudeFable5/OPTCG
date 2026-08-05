-- MANUAL: ST30-003 / 에드워드 뉴게이트 (2026-08-04 ST-30 신규 세트 수동 이식)
-- EN(series 569030)/JP(series 550030) 공식 카드리스트 기준, ST29 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST30-003]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              filter={
                base_power_eq=6000,
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
        source_text=[[【자신의 턴 동안】자신의 원래 파워 6000인 캐릭터 전부는 파워 +1000.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST30-003]],
    schema_version=1,
  })
end
