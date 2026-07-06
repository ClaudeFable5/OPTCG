-- AUTO-GENERATED: OP07-044 / 쥬라큘 미호크
-- rules_id=OP07-044 script_id=880000899 fingerprint=83fc3dc301357461981e15367eb0da9f051f2bb6dcaf4161f06be846cd5db5e3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-044]],
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
    rules_id=[[OP07-044]],
    schema_version=1,
  })
end
