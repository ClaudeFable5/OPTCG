-- AUTO-GENERATED: EB03-025 / 히나
-- rules_id=EB03-025 script_id=880002128 fingerprint=4bda65ba40dd735bb10954350f0a02c359c75b12023dacef02e9423913d57ecb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-025]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                base_power_eq=6000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패 1장을 버릴 수 있다: 원래 파워가 6000인 캐릭터를 1장까지 주인의 패로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-025]],
    schema_version=1,
  })
end
