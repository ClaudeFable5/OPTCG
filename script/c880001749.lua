-- AUTO-GENERATED: ST03-003 / 크로커다일
-- rules_id=ST03-003 script_id=880001749 fingerprint=c04808e21a905213093e9aa799117b165be0f0792fa0cf5da7eb4550f3650434
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST03-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_DECK_BOTTOM]],
            selector={
              count=1,
              filter={
                cost_lte=2,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】 【블록 시】코스트 2 이하인 캐릭터를 1장까지 주인의 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_BLOCK]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST03-003]],
    schema_version=1,
  })
end
