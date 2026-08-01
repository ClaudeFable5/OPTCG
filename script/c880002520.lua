-- AUTO-GENERATED PROMO: P-104 / 샹크스
-- rules_id=P-104 script_id=880002520
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-104]],
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
            count=10,
            op=[[ANY_FIELD_DON_EQ]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신 또는 상대의 필드에 두웅!!이 10장 있을 경우, 이 캐릭터는 상대의 효과로 필드를 벗어나지 않는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[P-104]],
    schema_version=1,
  })
end
