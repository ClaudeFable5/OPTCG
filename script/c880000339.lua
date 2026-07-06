-- AUTO-GENERATED: OP02-094 / 이스카
-- rules_id=OP02-094 script_id=880000339 fingerprint=b0d9e71c1d8ab9ce526fdc5fcc0a5d7bafa0c08b93f05b7036a2a42344e502d8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-094]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【두웅!!×1】【턴 1회】이 캐릭터의 배틀로 상대의 캐릭터를 KO 시켰을 때, 이 캐릭터를 액티브로 한다.]],
        timings={
          [[ON_BATTLE_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-094]],
    schema_version=1,
  })
end
