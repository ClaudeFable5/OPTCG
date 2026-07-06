-- AUTO-GENERATED: ST03-010 / 바솔로뮤 쿠마
-- rules_id=ST03-010 script_id=880001757 fingerprint=9d3b11da9b8d53b88d898d3a021d2c10f9841fe8e62b4a1f515701748c53822b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST03-010]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=3,
            destinations={
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
            op=[[LOOK_REORDER_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 3장을 보고, 원하는 순서대로 덱의 맨 위나 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST03-010]],
    schema_version=1,
  })
end
