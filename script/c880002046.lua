-- AUTO-GENERATED: P-052 / 쥬라큘 미호크
-- rules_id=P-052 script_id=880002046 fingerprint=8990dd5ca78084ede7d8e6edd65f7a207feb45eae482023a3509fd96add7b1d7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-052]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            attacker_filter={
              attribute=[[SLASH]],
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
        source_text=[[【두웅!!×1】이 캐릭터는 <참격> 속성을 가진 카드와의 배틀에서는 KO 당하지 않는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[P-052]],
    schema_version=1,
  })
end
