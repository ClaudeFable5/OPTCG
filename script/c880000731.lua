-- AUTO-GENERATED: OP05-118 / 카이도
-- rules_id=OP05-118 script_id=880000731 fingerprint=7592c93fd884f8917c43f47faad6faecd1db19633f2de355f9762f7ced071014
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-118]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=4,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            count=3,
            op=[[LIFE_LTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 라이프가 3장 이하인 경우, 카드를 4장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-118]],
    schema_version=1,
  })
end
