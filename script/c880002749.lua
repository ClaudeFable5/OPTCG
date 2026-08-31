-- MANUAL: OP17-043 / 간즈이 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-043]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            op=[[REPLACE_LEAVE_FIELD]],
            optional=true,
            reason=[[ANY]],
            replacement_costs={
              {
                count=2,
                op=[[TRASH_HAND]],
              },
            },
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 캐릭터가 필드를 벗어날 경우, 대신 자신의 패 2장을 버릴 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[SET_BASE_POWER]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
            value=6000,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더를 다음 상대의 엔드 페이즈 종료 시까지 원래 파워 6000으로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-043]],
    schema_version=1,
  })
end
