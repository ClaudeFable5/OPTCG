-- MANUAL: OP17-065 / 퀸 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-065]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[CANNOT_ATTACK]],
            selector={
              count=2,
              filter={
                cost_lte=5,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!!-1：카드를 1장 뽑고, 상대의 코스트 5 이하인 캐릭터 2장까지는 다음 상대의 엔드 페이즈 종료 시까지 어택할 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BANISH]],
    },
    rules_id=[[OP17-065]],
    schema_version=1,
  })
end
