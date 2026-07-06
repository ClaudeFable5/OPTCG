-- AUTO-GENERATED: PRB02-008 / 마르코
-- rules_id=PRB02-008 script_id=880001699 fingerprint=712b91c534188ce8e13ebc3d146bca67da4fed2285c347a1a1bef68f72e8d8ee
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[PRB02-008]],
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
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】카드를 2장 뽑는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[PRB02-008]],
    schema_version=1,
  })
end
