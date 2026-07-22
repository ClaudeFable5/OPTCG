-- AUTO-GENERATED: OP14-026 / 코즈키 오뎅
-- rules_id=OP14-026 script_id=880002191 fingerprint=25b3bdc42eb971adc002f928afedc2e9fa916e3efe29dbd21ccad6d55ddc9ffc
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-026]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
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
            op=[[SELF_STATE_IS]],
            state=[[RESTED]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】이 캐릭터가 레스트 상태인 경우, 이 캐릭터의 파워 +2000.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-026]],
    schema_version=1,
  })
end
