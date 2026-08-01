-- AUTO-GENERATED PROMO: P-135 / 몽키 D. 루피
-- rules_id=P-135 script_id=880002532
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-135]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=5,
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
        source_text=[[【등장 시】상대의 코스트 5 이하인 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[P-135]],
    schema_version=1,
  })
end
