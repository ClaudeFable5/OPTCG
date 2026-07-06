-- AUTO-GENERATED: OP02-014 / 화이티 베이
-- rules_id=OP02-014 script_id=880000258 fingerprint=1e97ae3671299dab39f46aa323521af51fae84c0b4373332e726bf2a8d1e72d6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-014]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[ALLOW_ATTACK_ACTIVE_CHARACTER]],
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
        once_per_turn=false,
        source_text=[[【두웅!!×1】이 캐릭터는 상대의 액티브 상태인 캐릭터도 어택할 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-014]],
    schema_version=1,
  })
end
