-- AUTO-GENERATED: ST13-016 / 야마토
-- rules_id=ST13-016 script_id=880001915 fingerprint=9cb522c5b51c9effe918d329a6308767cb66349b9bf97bf7e69a6a77544eb08d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST13-016]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            destination=[[DECK_TOP]],
            op=[[REORDER_ALL_LIFE_RETURN_ONE_TO_DECK]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 모든 라이프를 보고, 1장을 자신의 덱 맨 위로 되돌리고 라이프를 원하는 순서대로 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[RUSH]],
    },
    rules_id=[[ST13-016]],
    schema_version=1,
  })
end
