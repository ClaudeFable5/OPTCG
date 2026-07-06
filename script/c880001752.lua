-- AUTO-GENERATED: ST03-005 / 쥬라큘 미호크
-- rules_id=ST03-005 script_id=880001752 fingerprint=51ff485ed2ca50f8dac3513ced86e0137e3e381ab4ab371367ee843d73af31e6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST03-005]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
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
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】 【어택 시】카드를 2장 뽑고, 자신의 패를 2장 버린다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST03-005]],
    schema_version=1,
  })
end
