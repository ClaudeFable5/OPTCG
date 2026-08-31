-- MANUAL: ST33-004 / 볼사리노 (2026-08-28 6색 스타트덱 ST31~36 추가)
-- JP 공홈 series 550033 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST33-004]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            amount=-3,
            conditions={
              {
                op=[[HAND_DISCARDED_THIS_TURN]],
                player=[[YOU]],
              },
            },
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_HAND_COST]],
            player=[[YOU]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[패의 이 카드는, 효과로 자신의 패가 버려진 턴 동안, 코스트 -3.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST33-004]],
    schema_version=1,
  })
end
