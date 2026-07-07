-- AUTO-GENERATED: P-054 / 몽키 D. 가프
-- rules_id=P-054 script_id=880002048 fingerprint=28c3c0aa5c6cbb7ac475452ee5fbf772e81bbaeae50364b8b6fe659959d26c26
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-054]],
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
        source_text=[[【두웅!!×1】이 캐릭터는 <타격> 속성을 가진 카드와의 배틀에서는 KO 당하지 않는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[P-054]],
    schema_version=1,
  })
end
