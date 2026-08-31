-- MANUAL: OP17-095 / 롤로노아 조로 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-095]],
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
            op=[[REPLACE_LEAVE_FIELD]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_costs={
              {
                count=3,
                filter={},
                op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
                order=[[CHOOSE]],
              },
            },
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[자신의 캐릭터가 상대의 효과로 필드를 벗어날 경우, 대신 자신의 트래시에서 카드 3장을 원하는 순서로 덱 아래에 놓을 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-095]],
    schema_version=1,
  })
end
