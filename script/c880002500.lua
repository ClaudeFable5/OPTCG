-- AUTO-GENERATED PROMO: P-072 / 류마
-- rules_id=P-072 script_id=880002500
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-072]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=4,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】/【KO 시】상대의 코스트 4 이하인 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[ON_PLAY]],
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[P-072]],
    schema_version=1,
  })
end
