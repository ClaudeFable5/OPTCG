-- AUTO-GENERATED: ST01-005 / 징베
-- rules_id=ST01-005@07aee46cf469 script_id=880001716 fingerprint=07aee46cf46967deb4502a82bbceb226962f290dac3ba4eab1f5f349521ad95e
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
        source_text=[[【두웅!!×1】【어택 시】이번 턴 동안, 이 캐릭터 이외의 자신 리더 또는 캐릭터 1장까지의 파워 +1000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST01-005@07aee46cf469]],
    schema_version=1,
  })
end
