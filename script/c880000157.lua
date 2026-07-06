-- AUTO-GENERATED: OP01-034 / 이누아라시
-- rules_id=OP01-034 script_id=880000157 fingerprint=c2620bbd1b0789985e8dbc3cd8b8771486bd90e4fadc64cc2ac9e2027f6ece66
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-034]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】【어택 시】자신의 두웅!!을 1장까지 액티브로 한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-034]],
    schema_version=1,
  })
end
