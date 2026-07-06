-- AUTO-GENERATED: OP02-019 / 라쿠요
-- rules_id=OP02-019 script_id=880000263 fingerprint=3457ebee60576280f6126c5e9602d69f14f09b199ec74372153aca4bc1977a5e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-019]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=0,
              filter={
                trait_contains=[[흰 수염 해적단]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【자신의 턴 동안】자신의 『흰 수염 해적단』을 포함한 특징을 가진 모든 캐릭터의 파워 +1000.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-019]],
    schema_version=1,
  })
end
