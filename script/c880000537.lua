-- AUTO-GENERATED: OP04-045 / 킹
-- rules_id=OP04-045 script_id=880000537 fingerprint=eb0d2f51757547682cb08d23d3a15f8f5504237707b24ff1aadf16e576cc8e71
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-045]],
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
    rules_id=[[OP04-045]],
    schema_version=1,
  })
end
