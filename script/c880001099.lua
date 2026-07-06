-- AUTO-GENERATED: OP09-004 / 샹크스
-- rules_id=OP09-004 script_id=880001099 fingerprint=e58ec32ee87564ed483aeaa5db9a4be0a1439e3d3df22d5cd26e41bbc648dbaf
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-004]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-1000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=0,
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[상대의 모든 캐릭터의 파워 -1000.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={
      [[RUSH]],
    },
    rules_id=[[OP09-004]],
    schema_version=1,
  })
end
