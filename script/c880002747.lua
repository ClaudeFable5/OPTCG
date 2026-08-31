-- MANUAL: OP17-041 / 왕직 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-041]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_DECK_BOTTOM]],
            selector={
              count=0,
              filter={
                base_cost_eq=1,
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패 1장을 버릴 수 있다：상대의 원래 코스트 1인 캐릭터 모두를 주인이 원하는 순서로 덱 아래에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP17-041]],
    schema_version=1,
  })
end
