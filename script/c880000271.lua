-- AUTO-GENERATED: OP02-027 / 이누아라시
-- rules_id=OP02-027 script_id=880000271 fingerprint=42cc39769a894ed9fd7ba8fabd4e398c4bc880e21a1b434991405d8fabd7a872
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-027]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_LEAVE_FIELD]],
            reason=[[OPPONENT_EFFECT]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[ALL_DON_RESTED]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 모든 두웅!!이 레스트 상태인 경우, 이 캐릭터는 상대의 효과로는 필드를 벗어나지 않는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-027]],
    schema_version=1,
  })
end
