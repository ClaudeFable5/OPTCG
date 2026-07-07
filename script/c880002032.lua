-- AUTO-GENERATED: P-030 / 징베
-- rules_id=P-030 script_id=880002032 fingerprint=99e23886ef30e6e73cfe9ab535c358d9b78837d01f3eb9fc434458d32b83321a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-030]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_DECK_BOTTOM]],
            selector={
              count=1,
              filter={
                cost_lte=3,
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
        source_text=[[【KO 시】 코스트 3 이하인 캐릭터를 1장까지 주인의 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[P-030]],
    schema_version=1,
  })
end
