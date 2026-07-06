-- AUTO-GENERATED: EB02-053 / 오르가 미스키나
-- rules_id=EB02-053 script_id=880000115 fingerprint=822c37905da6d2714981f68425596dc61a031b8b5b1957f2cce9fa30ac63c10e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-053]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            destinations={
              [[LIFE_TOP]],
              [[LIFE_BOTTOM]],
            },
            mode=[[UP_TO]],
            op=[[LOOK_REORDER_LIFE_TOP]],
            player=[[ANY]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】/【KO 시】자신 또는 상대의 라이프 위에서 1장까지를 보고, 라이프 맨 위나 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-053]],
    schema_version=1,
  })
end
