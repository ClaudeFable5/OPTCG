-- MANUAL: OP17-012 / 블렌하임 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-012]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              cost_eq=1,
              trait_contains=[[흰 수염 해적단]],
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
        source_text=[[【KO 시】자신의 패에서 코스트 1인 『흰 수염 해적단』을 포함한 특징을 가진 카드 1장까지를 등장시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP17-012]],
    schema_version=1,
  })
end
