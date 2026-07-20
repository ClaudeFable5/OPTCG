-- AUTO-GENERATED: EB03-022 / 이스카
-- rules_id=EB03-022 script_id=880002125 fingerprint=39c9931e72ee184a0dd1fc07155d0f8c629b98010580da325d892fe765894ea8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-022]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_DECK_BOTTOM]],
            selector={
              count=1,
              filter={
                cost_lte=4,
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
        source_text=[[【등장 시】코스트 4 이하인 캐릭터를 1장까지 주인의 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB03-022]],
    schema_version=1,
  })
end
