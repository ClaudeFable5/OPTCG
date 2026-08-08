-- MANUAL: OP16-077 / 지장 "부처님 센고쿠" (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-077]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              trait=[[해군]],
            },
            look_count=5,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            reveal=true,
            select_count=2,
            select_mode=[[UP_TO]],
          },
          {
            count=1,
            mode=[[EXACT]],
            op=[[TRASH_HAND]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】 자신의 덱 위에서 5장을 보고, 특징 《해군》을 가진 카드 2장까지를 공개하고 패에 넣고, 나머지를 원하는 순서로 덱 아래에 놓는다. 그 후, 자신의 패 1장을 버린다.]],
        timings={
          [[MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-077]],
    schema_version=1,
  })
end
