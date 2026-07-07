-- AUTO-GENERATED: P-019 / 베포
-- rules_id=P-019 script_id=880002023 fingerprint=d1b0d2937da2e93597cd4f91a29127dc9e6d2a2dc3a3902253f81c0311662bb1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-019]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                power_lte=3000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】상대의 파워 3000 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[P-019]],
    schema_version=1,
  })
end
