-- MANUAL: OP17-103 / 샬롯 카타쿠리 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-103]],
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
          {
            amount=-3000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
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
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】【등장 시】자신의 리더가 특징 《빅 맘 해적단》을 가진 경우, 자신의 덱 위에서 1장까지를 라이프 위에 넣는다. 그 후, 상대의 캐릭터 1장까지를 이번 턴 동안 파워 -3000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-103]],
    schema_version=1,
  })
end
