-- AUTO-GENERATED PROMO: P-025 / 스모커
-- rules_id=P-025 script_id=880002483
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-025]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            attacker_filter={
              attribute_neq=[[SPECIAL]],
              card_type=[[CHARACTER]],
            },
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_BE_KO]],
            reason=[[BATTLE]],
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
        source_text=[[【두웅!!×1】이 캐릭터는 <특수> 속성을 가지지 않은 캐릭터와의 배틀에서는 KO 당하지 않는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[P-025]],
    schema_version=1,
  })
end
