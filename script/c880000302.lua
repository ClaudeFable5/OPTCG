-- AUTO-GENERATED: OP02-057 / 바솔로뮤 쿠마
-- rules_id=OP02-057 script_id=880000302 fingerprint=5750d86255eb922c1d30f86d3f592d7d30ffae96fe5790b122a6bc6028515857
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-057]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              trait=[[왕의 부하 칠무해]],
            },
            look_count=2,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destinations={
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
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
        source_text=[[【등장 시】자신의 덱 위에서 2장을 보고, 《왕의 부하 칠무해》 특징을 가진 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 위나 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-057]],
    schema_version=1,
  })
end
