-- AUTO-GENERATED: OP01-028 / 필살 초록성 라플레시아
-- rules_id=OP01-028 script_id=880000151 fingerprint=c215b83dde1c19457c9a1d662efacf337805b6d2e419120e11da0886fba43ef5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-028]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】 이번 턴 동안, 상대 리더 또는 캐릭터 1장까지의 파워 -2000.]],
        timings={
          [[COUNTER]],
        },
      },
      {
        actions={
          {
            effect_timing=[[COUNTER]],
            op=[[ACTIVATE_CARD_EFFECT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드의 【카운터】 효과를 발동한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-028]],
    schema_version=1,
  })
end
