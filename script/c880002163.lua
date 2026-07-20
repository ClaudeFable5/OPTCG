-- AUTO-GENERATED: EB03-060 / 내 시종이 될래?
-- rules_id=EB03-060 script_id=880002163 fingerprint=28dde1467cfe921d6d19cbbaa420f47842d28f2dc0e67885bf26813f76f5de61
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-060]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              cost_gte=2,
              cost_lte=8,
            },
            look_count=4,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            reveal=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={
          {
            name=[[나미]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 리더가 「나미」인 경우, 자신의 덱 위에서 4장을 보고, 코스트 2에서 8인 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            effect_timing=[[MAIN]],
            op=[[ACTIVATE_CARD_EFFECT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드의 【메인】 효과를 발동한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-060]],
    schema_version=1,
  })
end
