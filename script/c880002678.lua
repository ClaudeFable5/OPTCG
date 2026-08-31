-- MANUAL: ST31-002 / 징베 (2026-08-28 6색 스타트덱 ST31~36 추가)
-- JP 공홈 series 550031 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST31-002]],
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
            count=1,
            filter={
              cost_eq=1,
              trait=[[밀짚모자 일당]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】카드를 1장 뽑고, 자신의 패에서 코스트 1인 특징 《밀짚모자 일당》을 가진 카드 1장까지를 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST31-002]],
    schema_version=1,
  })
end
