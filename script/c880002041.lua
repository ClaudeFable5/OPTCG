-- AUTO-GENERATED: P-047 / 몽키 D. 루피
-- rules_id=P-047 script_id=880002041 fingerprint=2812a53e630da358daf7ccf754ddf5385d8be8fbd29e2e5c543c283d4281f55e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-047]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            count=3,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】자신의 패가 3장 이하인 경우, 카드를 1장 뽑는다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[P-047]],
    schema_version=1,
  })
end
