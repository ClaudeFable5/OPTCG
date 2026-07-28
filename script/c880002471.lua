-- AUTO-GENERATED: EB04-050 / 조교해줄게♡
-- rules_id=EB04-050 script_id=880002471 fingerprint=170f0a1efa5a5bec0ee94a1cbdf581fec980ed0898fc5e7a3344619ba89fad91
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-050]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[ALLOW_ATTACK_ACTIVE_CHARACTER]],
            selector={
              count=1,
              filter={
                trait=[[SWORD]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 《SWORD》 특징을 가진 리더나 캐릭터 1장까지는 이번 턴 동안 액티브 상태인 캐릭터에게도 어택할 수 있다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【카운터】자신의 리더는 이번 배틀 동안 파워 +3000.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-050]],
    schema_version=1,
  })
end
