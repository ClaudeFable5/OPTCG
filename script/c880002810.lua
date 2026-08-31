-- MANUAL: OP17-104 / 샬롯 크래커 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-104]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[빅 맘 해적단]],
          },
        },
        costs={
          {
            count=2,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】【등장 시】자신의 두웅!! 2장을 레스트로 할 수 있다：자신의 리더가 특징 《빅 맘 해적단》을 가진 경우, 자신의 덱 위에서 1장까지를 라이프 위에 넣는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-104]],
    schema_version=1,
  })
end
