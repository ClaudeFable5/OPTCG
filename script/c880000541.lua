-- AUTO-GENERATED: OP04-049 / 잭
-- rules_id=OP04-049 script_id=880000541 fingerprint=2ebcd68c7549ea57e584eb6734dcb6dc9037cf9496f69a04832a0c871440a80a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-049]],
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
        source_text=[[【KO 시】카드를 1장 뽑는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-049]],
    schema_version=1,
  })
end
