-- AUTO-GENERATED: OP06-088 / 사이
-- rules_id=OP06-088 script_id=880000822 fingerprint=831802fe1f6d0a367b510716d2a4a2459258ed906a693adf0285c594f4bb230e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-088]],
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
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[드레스로자]],
          },
          {
            op=[[LEADER_STATE_IS]],
            player=[[YOU]],
            state=[[ACTIVE]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 《드레스로자》 특징을 가지고, 자신의 리더가 액티브 상태인 경우, 이 캐릭터의 파워 +2000.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-088]],
    schema_version=1,
  })
end
