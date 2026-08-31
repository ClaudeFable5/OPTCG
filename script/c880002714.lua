-- MANUAL: OP17-008 / 죠즈 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-008]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[SET_BASE_POWER]],
            selector={
              count=1,
              filter={
                name=[[에드워드 뉴게이트]],
              },
              kind=[[LEADER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
            value=8000,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더 「에드워드 뉴게이트」를 다음 상대의 엔드 페이즈 종료 시까지 원래 파워 8000으로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-008]],
    schema_version=1,
  })
end
