-- AUTO-GENERATED: ST08-009 / 마키노
-- rules_id=ST08-009 script_id=880001842 fingerprint=577f9b3e39366a2026adf1e1b44bf3e6512465cb50dad5d4fbbe11e79e0682f1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST08-009]],
    compile_status=[[AUTO]],
    effects={
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
              cost_eq=0,
            },
            op=[[CHARACTER_EXISTS]],
            player=[[ANY]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】코스트 0인 캐릭터가 있을 경우, 카드를 1장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST08-009]],
    schema_version=1,
  })
end
