-- AUTO-GENERATED: EB02-057 / 매드 트레저
-- rules_id=EB02-057 script_id=880000119 fingerprint=66928c442bd5ecea483ed45b29b32c71582a489f439bc8df3ec074c46085d4a6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-057]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            faceup=true,
            op=[[ADD_TO_LIFE]],
            player=[[OPPONENT]],
            positions={
              [[LIFE_TOP]],
              [[LIFE_BOTTOM]],
            },
            selector={
              count=1,
              filter={
                cost_lte=3,
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
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP_OR_BOTTOM]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 라이프 위나 아래에서 1장을 패에 더할 수 있다: 상대의 코스트 3 이하인 캐릭터를 1장까지 상대의 라이프 맨 위나 아래에 앞면으로 더한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-057]],
    schema_version=1,
  })
end
