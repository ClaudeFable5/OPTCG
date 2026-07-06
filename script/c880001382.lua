-- AUTO-GENERATED: OP11-048 / 카포네 벳지
-- rules_id=OP11-048 script_id=880001382 fingerprint=2dc8503ecea54456c26a6f8099f367d1ba75f159ad88b9b929b64e20a8283751
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-048]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              cost_gte=2,
              trait_any={
                [[파이어탱크 해적단]],
                [[밀짚모자 일당]],
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
        source_text=[[【등장 시】자신의 덱 위에서 4장을 보고, 코스트 2 이상인 《파이어탱크 해적단》 또는 《밀짚모자 일당》 특징을 가진 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-048]],
    schema_version=1,
  })
end
