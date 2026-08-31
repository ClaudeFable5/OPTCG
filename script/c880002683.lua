-- MANUAL: ST32-002 / 코즈키 오뎅 (2026-08-28 6색 스타트덱 ST31~36 추가)
-- JP 공홈 series 550032 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST32-002]],
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
            op=[[CANNOT_BE_RESTED]],
            selector={
              count=1,
              filter={
                base_cost_lte=6,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】카드를 1장 뽑고, 상대의 원래 코스트 6 이하인 캐릭터 1장까지는 다음 상대의 엔드 페이즈 종료 시까지 레스트로 할 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST32-002]],
    schema_version=1,
  })
end
