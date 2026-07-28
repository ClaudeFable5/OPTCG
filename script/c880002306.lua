-- AUTO-GENERATED: OP15-004 / 바다 고양이
-- rules_id=OP15-004 script_id=880002306 fingerprint=dacc9a40e922cee3bef01a06bb1121765342b779409b7acdba4a8d85c81e45bf
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-004]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-3000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            count=0,
            op=[[LEADER_POWER_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 파워 0 이하인 경우, 상대의 캐릭터 1장까지는 이번 턴 동안 파워 -3000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-004]],
    schema_version=1,
  })
end
