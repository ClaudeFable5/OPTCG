-- AUTO-GENERATED: OP11-054 / 나미
-- rules_id=OP11-054 script_id=880001388 fingerprint=fef717ab94a469625bf2cd0ee5eec35933d963640224a6cdf67c4e7f4aed7bdb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-054]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=3,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=2,
            op=[[RETURN_HAND_TO_DECK]],
            order=[[CHOOSE]],
            player=[[YOU]],
            positions={
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_IS_MULTICOLOR]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 다색인 경우, 카드를 3장 뽑고, 자신의 패 2장을 원하는 순서대로 덱 맨 위나 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP11-054]],
    schema_version=1,
  })
end
