-- MANUAL: OP17-047 / 시키 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-047]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[RETURN_HAND_TO_DECK]],
            order=[[CHOOSE]],
            player=[[OPPONENT]],
            positions={
              [[DECK_BOTTOM]],
            },
          },
        },
        conditions={
          {
            count=2,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 패가 2장 이하인 경우, 상대는 자신의 패 1장을 덱 아래에 놓는다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-047]],
    schema_version=1,
  })
end
