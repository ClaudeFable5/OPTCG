-- MANUAL: OP17-045 / 쿄 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-045]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            op=[[REPLACE_LEAVE_FIELD]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_costs={
              {
                count=2,
                op=[[TRASH_HAND]],
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
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 캐릭터가 상대의 효과로 필드를 벗어날 경우, 대신 자신의 패 2장을 버릴 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】카드를 1장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-045]],
    schema_version=1,
  })
end
