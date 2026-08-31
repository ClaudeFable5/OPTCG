-- MANUAL: OP17-066 / 쿠로즈미 오로치 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-066]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            filter={
              cost_gte=10,
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!!-1：자신의 코스트 10 이상인 캐릭터가 있을 경우, 카드를 2장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-066]],
    schema_version=1,
  })
end
