-- MANUAL: OP16-082 / 킨에몬 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-082]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            amount=3,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 캐릭터의 코스트 +3.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              trait=[[와노쿠니]],
            },
            look_count=5,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[TRASH]],
            reveal=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[와노쿠니]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】 자신의 리더가 특징 《와노쿠니》를 가질 경우, 자신의 덱 위에서 5장을 보고, 특징 《와노쿠니》를 가진 카드 1장까지를 공개하고 패에 넣는다. 그 후, 나머지를 트래시에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-082]],
    schema_version=1,
  })
end
