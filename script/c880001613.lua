-- AUTO-GENERATED: OP13-041 / 이조
-- rules_id=OP13-041 script_id=880001613 fingerprint=14fc0e611b31a7730f4f0f61b64b667e3df524f5ca7520b864f49a4281836303
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-041]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】카드를 2장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-041]],
    schema_version=1,
  })
end
