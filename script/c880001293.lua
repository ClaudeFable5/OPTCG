-- AUTO-GENERATED: OP10-078 / 가족을 비웃는 놈은 내가 용서 못 해…!!!
-- rules_id=OP10-078 script_id=880001293 fingerprint=5f2da6e1ee1ed194aaa294edfc9f3022cb07cc3b9d8ce7ef958cb7a28aa648ce
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-078]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              name_neq=[[가족을 비웃는 놈은 내가 용서 못 해...!!!]],
              trait=[[돈키호테 해적단]],
            },
            look_count=3,
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
        source_text=[[【메인】/【카운터】자신의 덱 위에서 3장을 보고, 「가족을 비웃는 놈은 내가 용서 못 해...!!!」 이외의 《돈키호테 해적단》 특징을 가진 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[MAIN]],
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-078]],
    schema_version=1,
  })
end
