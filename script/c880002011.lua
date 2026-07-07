-- AUTO-GENERATED: P-007 / 몽키 D. 루피
-- rules_id=P-007 script_id=880002011 fingerprint=ff164ead1d47c03c39e49760cfda572d1ee16b08bf0b9c734a61d11199cca182
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-007]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            attacker_filter={
              attribute=[[STRIKE]],
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
        source_text=[[【두웅!!×1】이 캐릭터는 <타격> 속성을 지닌 리더와 캐릭터의 배틀로는 KO 당하지 않는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[P-007]],
    schema_version=1,
  })
end
