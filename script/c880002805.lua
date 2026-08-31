-- MANUAL: OP17-099 / 샬롯 링링 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-099]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            op=[[OPPONENT_CHOOSES]],
            options={
              {
                {
                  count=1,
                  op=[[TRASH_HAND]],
                  player=[[YOU]],
                },
                {
                  count=1,
                  mode=[[UP_TO]],
                  op=[[ADD_LIFE_FROM_DECK_TOP]],
                  player=[[YOU]],
                },
              },
              {
                {
                  count=1,
                  op=[[TRASH_HAND]],
                  player=[[OPPONENT]],
                },
              },
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
        source_text=[[【어택 시】자신의 패 1장을 버릴 수 있다：상대는 다음 중 1개를 선택한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-099]],
    schema_version=1,
  })
end
