-- AUTO-GENERATED: OP10-107 / 쥬얼리 보니
-- rules_id=OP10-107 script_id=880001322 fingerprint=f1fbbbd21c8e155aa11e745b00fcec14539dc689ab0acdd91e1d5d6a9f1422a7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-107]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            faceup=true,
            filter={
              card_type=[[CHARACTER]],
              cost_eq=5,
              trait=[[초신성]],
            },
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_HAND]],
            player=[[YOU]],
            position=[[LIFE_TOP]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP_OR_BOTTOM]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 라이프 위나 아래에서 1장을 패에 더할 수 있다: 자신의 패에서 코스트 5인 《초신성》 특징을 가진 캐릭터 카드를 1장까지 라이프 맨 위에 앞면으로 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP10-107]],
    schema_version=1,
  })
end
