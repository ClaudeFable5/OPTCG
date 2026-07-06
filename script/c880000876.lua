-- AUTO-GENERATED: OP07-022 / 오타마
-- rules_id=OP07-022 script_id=880000876 fingerprint=77d6462d4e21179f0bed3af5b48ec4b64a32790dc567450039b253b92bb79463
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-022]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              color=[[GREEN]],
              name_neq=[[오타마]],
              trait=[[와노쿠니]],
            },
            look_count=5,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            reveal=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 5장을 보고, 「오타마」 이외의 녹색인 《와노쿠니》 특징을 가진 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-022]],
    schema_version=1,
  })
end
