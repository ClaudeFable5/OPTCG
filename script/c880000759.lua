-- AUTO-GENERATED: OP06-025 / 케이미
-- rules_id=OP06-025 script_id=880000759 fingerprint=8e55d0cc879cc393b80561f1eb5c69f91f7605cacb94146567a263a872b98bd4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-025]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              name_neq=[[케이미]],
              trait_any={
                [[어인족]],
                [[인어족]],
              },
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
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 4장을 보고, 「케이미」 이외의 《어인족》 또는 《인어족》 특징을 가진 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-025]],
    schema_version=1,
  })
end
