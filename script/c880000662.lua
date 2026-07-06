-- AUTO-GENERATED: OP05-050 / 히나
-- rules_id=OP05-050 script_id=880000662 fingerprint=0a6c6fdb00024026ebae1d2fe336b38f71b140fbc8d807947277e2529b9f8016
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-050]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            count=5,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패가 5장 이하인 경우, 카드를 1장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-050]],
    schema_version=1,
  })
end
