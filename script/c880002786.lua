-- MANUAL: OP17-080 / 우솝 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-080]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            amount=3000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            filter={
              cost_gte=12,
            },
            op=[[CHARACTER_EXISTS]],
            player=[[ANY]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[코스트 12 이상인 캐릭터가 있을 경우, 이 캐릭터의 파워 +3000.]],
        timings={
          [[CONTINUOUS]],
        },
      },

      {
        actions={
          {
            destination=[[HAND]],
            filter={
              trait=[[엘바프]],
            },
            look_count=3,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[TRASH]],
            reveal=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 3장을 보고, 특징 《엘바프》를 가진 카드 1장까지를 공개하고 패에 넣는다. 그 후, 나머지를 트래시에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-080]],
    schema_version=1,
  })
end
