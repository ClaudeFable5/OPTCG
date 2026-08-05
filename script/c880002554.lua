-- MANUAL: ST30-014 / Mr.3 (갤디노) (2026-08-04 ST-30 신규 세트 수동 이식)
-- EN(series 569030)/JP(series 550030) 공식 카드리스트 기준, ST29 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST30-014]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=2,
              filter={
                base_power_eq=6000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 레스트로 할 수 있다: 자신의 원래 파워 6000인 캐릭터 2장까지에 레스트 상태인 두웅!!을 2장씩까지 붙인다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST30-014]],
    schema_version=1,
  })
end
