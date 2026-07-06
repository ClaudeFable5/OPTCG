-- AUTO-GENERATED: EB02-026 / 네펠타리 비비
-- rules_id=EB02-026 script_id=880000087 fingerprint=1cd9790dc3a820f7af97a1179b13e7afcece29b83f9a792afddec5dbd17135f2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-026]],
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
          {
            count=5,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 다색이고 자신의 패가 5장 이하인 경우, 카드를 2장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-026]],
    schema_version=1,
  })
end
