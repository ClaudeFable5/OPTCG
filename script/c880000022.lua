-- AUTO-GENERATED: EB01-023 / 에드워드 위블
-- rules_id=EB01-023 script_id=880000022 fingerprint=09b0563308fd0dff14983b1c52c7bb21ff55f1ef4980d41d9cd6b52b8bd015c1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-023]],
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
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】카드를 1장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-023]],
    schema_version=1,
  })
end
