-- AUTO-GENERATED: OP07-054 / 마가렛
-- rules_id=OP07-054 script_id=880000909 fingerprint=87c935c60ffd56e6b768b433422c38433eb2f6eec5e44b2a4639838da3160830
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-054]],
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
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】카드를 1장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP07-054]],
    schema_version=1,
  })
end
