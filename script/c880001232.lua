-- AUTO-GENERATED: OP10-017 / 록
-- rules_id=OP10-017 script_id=880001232 fingerprint=52d4baecabd7e642f5bc10e71cf72f87744a0d3ad27bb2da18a9aaf188ea9a15
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-017]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              name=[[스카치]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            name=[[스카치]],
            op=[[CHARACTER_NAME_ABSENT]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 「스카치」가 없을 경우, 자신의 패에서 「스카치」를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-017]],
    schema_version=1,
  })
end
