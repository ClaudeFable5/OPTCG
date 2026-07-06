-- AUTO-GENERATED: EB02-014 / 서팡클
-- rules_id=EB02-014 script_id=880000075 fingerprint=ae0254a51955285b9f93fcf963e58ca0cbbd12d5774ea83c46eca8ebe2bf4b58
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-014]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              name=[[가이몬]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 「가이몬」을 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-014]],
    schema_version=1,
  })
end
