-- AUTO-GENERATED: EB03-011 / 언젠가 우리들이 다시 만나게 되면!!! 다시 한 번 동료라 불러주겠어?!!!
-- rules_id=EB03-011 script_id=880002114 fingerprint=fd2aaab794736b3a624996434d44c95e4f201db2539ab69782e9de2bd1003a62
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-011]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=4000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            name=[[네펠타리 비비]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】자신의 리더가 「네펠타리 비비」인 경우, 이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +4000.]],
        timings={
          [[COUNTER]],
        },
      },
      {
        actions={
          {
            amount=-2000,
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
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -2000.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-011]],
    schema_version=1,
  })
end
