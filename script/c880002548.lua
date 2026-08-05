-- MANUAL: ST30-008 / 마르코 (2026-08-04 ST-30 신규 세트 수동 이식)
-- EN(series 569030)/JP(series 550030) 공식 카드리스트 기준, ST29 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST30-008]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=true,
            source=[[TRASH]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              power_eq=6000,
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 패에서 파워 6000인 캐릭터 카드 1장을 버릴 수 있다: 이 캐릭터 카드를 트래시에서 레스트 상태로 등장시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST30-008]],
    schema_version=1,
  })
end
