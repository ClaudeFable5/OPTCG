-- AUTO-GENERATED: OP11-027 / 교로메
-- rules_id=OP11-027 script_id=880001361 fingerprint=f1238b88a20a012181604bc5cff63062b952cf38af5111f6eea708107d25ec05
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-027]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[TURN_PLAYED]],
            op=[[ALLOW_ATTACK_CHARACTER]],
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
            name=[[시라호시]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 「시라호시」인 경우, 이 캐릭터는 등장한 턴에 캐릭터를 어택할 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-027]],
    schema_version=1,
  })
end
