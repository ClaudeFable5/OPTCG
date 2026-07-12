-- AUTO-GENERATED: OP13-086 / 샤를리아 궁
-- rules_id=OP13-086 script_id=880001658 fingerprint=c0f5199d79bd7510f4b93f1d0653ea85906f91781f3c1c108e4fcd33bf131e0d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-086]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              name_neq=[[샤를리아 궁]],
              trait=[[천룡인]],
            },
            look_count=3,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[TRASH]],
            rest_order=[[KEEP]],
            reveal=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 3장을 보고, 「샤를리아 궁」 이외의 《천룡인》 특징을 가진 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 트래시에 놓고, 자신의 패 1장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-086]],
    schema_version=1,
  })
end
