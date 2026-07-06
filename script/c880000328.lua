-- AUTO-GENERATED: OP02-083 / 한냐발
-- rules_id=OP02-083 script_id=880000328 fingerprint=09386ecd3ae8346d5adcbe6ebc35c1a9f3c72622458345d7e20be2f6d082d9e6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-083]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              color=[[PURPLE]],
              name_neq=[[한냐발]],
              trait=[[임펠 다운]],
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
        source_text=[[【등장 시】자신의 덱 위에서 5장을 보고, 「한냐발」 이외의 자색인 《임펠 다운》 특징을 가진 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-083]],
    schema_version=1,
  })
end
