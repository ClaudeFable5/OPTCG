-- AUTO-GENERATED: ST01-005 / 징베
-- rules_id=ST01-005 script_id=880001715 fingerprint=b187e033e3746848299e46389b831fe6d83b69aa55952389c6d9fbe323b31c9f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST01-005]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                exclude_self=true,
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!x1】【어택 시】이번 턴 동안, 이 캐릭터 이외의 자신의 리더 또는 캐릭터 1장까지의 파워 +1000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST01-005]],
    schema_version=1,
  })
end
