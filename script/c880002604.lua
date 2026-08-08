-- MANUAL: OP16-047 / 돈키호테 도플라밍고 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-047]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=2,
            destination=[[DECK_BOTTOM]],
            mode=[[EXACT]],
            op=[[RETURN_HAND_TO_DECK]],
            order=[[CHOOSE]],
            player=[[OPPONENT]],
          },
        },
        conditions={
          {
            count=8,
            op=[[HAND_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동 메인】 이 캐릭터를 레스트로 할 수 있다：상대의 패가 8장 이상 있을 경우, 상대는 자신의 패 2장을 원하는 순서로 덱 아래에 놓는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-047]],
    schema_version=1,
  })
end
