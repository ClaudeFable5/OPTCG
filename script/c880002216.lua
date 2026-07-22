-- AUTO-GENERATED: OP14-051 / 핫짱
-- rules_id=OP14-051 script_id=880002216 fingerprint=7c0f21c1fc7de539005a8e62bb5f6d52d64ffe38400b3196fb5db10cd4711f49
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-051]],
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
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】【KO 시】카드를 1장 뽑는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-051]],
    schema_version=1,
  })
end
