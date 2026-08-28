-- MANUAL: OP16-085 / 코즈키 모모노스케 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-085]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=6,
              name_neq=[[코즈키 모모노스케]],
              trait=[[와노쿠니]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】 자신의 트래시에서 「코즈키 모모노스케」 이외의 코스트 6 이하인 특징 《와노쿠니》를 가진 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP16-085]],
    schema_version=1,
  })
end
