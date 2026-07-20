-- AUTO-GENERATED: EB03-004 / 카리나
-- rules_id=EB03-004 script_id=880002107 fingerprint=68749456d36e4f8f5f488b1b82461277311562e248c3a8e74d459991b611f01c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-004]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=4000,
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
            op=[[LEADER_IS_MULTICOLOR]],
            player=[[YOU]],
          },
          {
            count=0,
            filter={
              base_power_gte=6000,
            },
            op=[[CHARACTER_COUNT_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】자신의 리더가 다색이고 자신의 원래 파워가 6000 이상인 캐릭터가 없을 경우, 이 캐릭터의 파워 +4000.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB03-004]],
    schema_version=1,
  })
end
