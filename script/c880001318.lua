-- AUTO-GENERATED: OP10-103 / 카포네 벳지
-- rules_id=OP10-103 script_id=880001318 fingerprint=af46d2c08f75c6131e56917ce9144d97343e708b22d2715262f5001d70f26a95
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-103]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            faceup=true,
            filter={
              card_type=[[CHARACTER]],
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
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 라이프 위나 아래에서 1장을 패에 더할 수 있다: 자신의 패에서 《초신성》 특징을 가진 캐릭터 카드를 1장까지 라이프 맨 위에 앞면으로 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-103]],
    schema_version=1,
  })
end
