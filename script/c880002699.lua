-- MANUAL: ST35-003 / 카라스 (2026-08-28 6색 스타트덱 ST31~36 추가)
-- JP 공홈 series 550035 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST35-003]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[OPPONENT]],
          },
        },
        conditions={
          {
            count=7,
            op=[[HAND_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={
          {
            count=2,
            op=[[MILL_DECK]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 덱 위에서 2장을 트래시에 놓을 수 있다：상대의 패가 7장 이상인 경우, 상대는 자신의 패 1장을 버린다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST35-003]],
    schema_version=1,
  })
end
