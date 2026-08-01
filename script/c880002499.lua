-- AUTO-GENERATED PROMO: P-071 / 마르코
-- rules_id=P-071 script_id=880002499
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-071]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[ADD_SELF_TO_HAND]],
            optional=true,
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】이 캐릭터 카드를 패에 더할 수 있다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[P-071]],
    schema_version=1,
  })
end
