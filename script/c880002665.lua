-- MANUAL: OP16-108 / 시류 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-108]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            faceup=true,
            filter={
              cost_lte=6,
              trait=[[검은 수염 해적단]],
            },
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_TRASH]],
            player=[[YOU]],
            position=[[TOP]],
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
        source_text=[[【등장 시】 자신의 패 1장을 버릴 수 있다：자신의 트래시에서 코스트 6 이하인 특징 《검은 수염 해적단》을 가진 카드 1장까지를 라이프 위에 앞면으로 넣는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】 카드 2장을 뽑는다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-108]],
    schema_version=1,
  })
end
