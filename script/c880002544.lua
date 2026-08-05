-- MANUAL: ST30-004 / 엠포리오 이반코프 (2026-08-04 ST-30 신규 세트 수동 이식)
-- EN(series 569030)/JP(series 550030) 공식 카드리스트 기준, ST29 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST30-004]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=3,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=2,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=2,
            filter={
              card_type=[[CHARACTER]],
              power_eq=6000,
            },
            op=[[REVEAL_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 파워 6000인 캐릭터 카드 2장을 공개할 수 있다: 카드를 3장 뽑고, 자신의 패 2장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST30-004]],
    schema_version=1,
  })
end
