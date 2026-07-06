-- AUTO-GENERATED: OP10-074 / 피카
-- rules_id=OP10-074 script_id=880001289 fingerprint=0fb31234e523d8ba88aca4f1ee272497ff03c77a7ee4bdafc666716dbb22690e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-074]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_KO]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_costs={
              {
                count=2,
                op=[[REST_DON]],
              },
            },
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【턴 1회】이 캐릭터가 상대의 효과로 KO 당할 경우, 대신 자신의 액티브 상태인 두웅!! 2장을 레스트할 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-074]],
    schema_version=1,
  })
end
