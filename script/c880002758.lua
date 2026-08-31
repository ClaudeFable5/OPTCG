-- MANUAL: OP17-052 / 돈 말론 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-052]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            destination=[[HAND]],
            filter={
              card_type=[[EVENT]],
              color=[[BLUE]],
              cost_eq=0,
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 트래시에서 코스트 0인 청색 이벤트 1장까지를 패에 넣는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-052]],
    schema_version=1,
  })
end
