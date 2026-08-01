-- AUTO-GENERATED PROMO: P-098 / 버기
-- rules_id=P-098 script_id=880002514
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-098]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_DECK_BOTTOM]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=4,
            filter={
              cost_gte=5,
            },
            op=[[CHARACTER_COUNT_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 코스트 5 이상인 캐릭터가 5장 없을 경우, 이 캐릭터를 주인의 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[P-098]],
    schema_version=1,
  })
end
