-- AUTO-GENERATED: EB04-025 / 네펠타리 비비
-- rules_id=EB04-025 script_id=880002446 fingerprint=547bc6c13ce6b9ad35288046a19c8dc55fca246d8dc56f72aee551522b67b71e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-025]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=8,
              name_neq=[[네펠타리 비비]],
              trait=[[알라바스타 왕국]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
          {
            count=1,
            op=[[RETURN_HAND_TO_DECK]],
            player=[[OPPONENT]],
            positions={
              [[DECK_BOTTOM]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 「네펠타리 비비」 이외의 코스트 8 이하인 《알라바스타 왕국》 특징을 가진 캐릭터 카드 1장까지를 등장시킨다. 그 후, 상대는 자신의 패 1장을 덱 맨 아래에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-025]],
    schema_version=1,
  })
end
