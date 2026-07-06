-- AUTO-GENERATED: OP12-112 / 베이비 5
-- rules_id=OP12-112 script_id=880001565 fingerprint=31be7f5da8ac5c9ea0f0e879de09101dc883d193e116a47b81f28c48cca04868
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-112]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_IS_MULTICOLOR]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 다색인 경우, 카드를 2장 뽑는다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-112]],
    schema_version=1,
  })
end
