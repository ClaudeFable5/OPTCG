-- AUTO-GENERATED: OP13-105 / 코즈키 모모노스케
-- rules_id=OP13-105 script_id=880001677 fingerprint=577b90e576dd06a2701c3c89c8405ddf86b218f0c6e4cdd7c33daaa27eb60bff
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-105]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[LOOK_REORDER_ALL_LIFE]],
            order=[[CHOOSE]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 모든 라이프를 보고, 원하는 순서대로 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-105]],
    schema_version=1,
  })
end
