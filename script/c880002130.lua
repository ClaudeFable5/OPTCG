-- AUTO-GENERATED: EB03-027 / 마가렛
-- rules_id=EB03-027 script_id=880002130 fingerprint=5ca95d223f35f5192c2e3bf91e7b38292be1220d244461fe30c70a1743432353
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-027]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                base_power_eq=7000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】원래 파워가 7000인 캐릭터를 1장까지 주인의 패로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-027]],
    schema_version=1,
  })
end
