-- AUTO-GENERATED: OP05-085 / 네펠타리 코브라
-- rules_id=OP05-085 script_id=880000698 fingerprint=cf80665fd904e357111538537d022e5eb4d7ce5ce2da6cfa2d4d873d95c7515c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-085]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[MILL_DECK]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 1장을 트래시에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP05-085]],
    schema_version=1,
  })
end
