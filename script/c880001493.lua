-- AUTO-GENERATED: OP12-040 / 쿠잔
-- rules_id=OP12-040 script_id=880001493 fingerprint=9857b36f1bdaa8c20e7f1dd95c3034b509ed5daa5f7a3d87bfc2df9ece35c8bc
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-040]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[DRAW_EVENT_COUNT]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[EVENT_SOURCE_TRAIT_CONTAINS]],
            owner=[[YOU]],
            trait=[[해군]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 《해군》 특징을 가진 카드의 효과로 자신의 패에서 카드가 버려졌을 때, 버린 수만큼 카드를 뽑는다.]],
        timings={
          [[ON_HAND_DISCARDED_BY_TRAIT_EFFECT]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-040]],
    schema_version=1,
  })
end
