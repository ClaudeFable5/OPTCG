-- AUTO-GENERATED: OP02-026 / 상디
-- rules_id=OP02-026 script_id=880000270 fingerprint=fc82e2dc515c8fec1ce79a7a32e6b2d11c24c79859f88097dea94974525b86bf
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-026]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            count=3,
            op=[[CHARACTER_COUNT_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【턴 1회】자신이 원래 효과가 없는 캐릭터를 패에서 등장시켰을 때, 자신의 캐릭터가 3장 이하인 경우, 자신의 두웅!!을 2장까지 액티브로 한다.]],
        timings={
          [[ON_OWN_VANILLA_CHARACTER_PLAYED_FROM_HAND]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-026]],
    schema_version=1,
  })
end
