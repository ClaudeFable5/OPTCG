-- AUTO-GENERATED: OP03-083 / 코기
-- rules_id=OP03-083 script_id=880000449 fingerprint=35c5dc195c2c9a96a54819b2d13bd261f55aa1212f09c81339ed391e297f1dcd
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-083]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[TRASH]],
            filter={},
            look_count=5,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            select_count=2,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 5장을 보고, 카드를 2장까지 트래시에 놓는다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-083]],
    schema_version=1,
  })
end
