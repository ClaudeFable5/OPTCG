-- AUTO-GENERATED: ST12-010 / 엠포리오 이반코프
-- rules_id=ST12-010 script_id=880001892 fingerprint=567895bcaf88ce6b72021c73894b67a9d017fae03bcd407a8f31c72551b407b2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST12-010]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            filter={
              card_type=[[CHARACTER]],
              cost_eq=2,
            },
            look_count=1,
            op=[[PLAY_FROM_DECK_TOP]],
            player=[[YOU]],
            rest_destinations={
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
            rest_order=[[CHOOSE]],
            rested=false,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 1장을 공개하고, 코스트 2인 캐릭터 카드를 1장까지 등장시킨다. 그 후, 남은 카드를 덱 맨 위나 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
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
            count=6,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【어택 시】【턴 1회】자신의 패가 6장 이하인 경우, 카드를 1장 뽑는다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST12-010]],
    schema_version=1,
  })
end
