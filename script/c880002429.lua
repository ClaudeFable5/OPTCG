-- AUTO-GENERATED: EB04-008 / 디스토션 퓨처
-- rules_id=EB04-008 script_id=880002429 fingerprint=12675eb7a2fa9ab639f056751b9de2e2d8f134025a001d3d8f09c43874d896fe
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-008]],
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
            count=2,
            op=[[LIFE_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 라이프가 2장 이하인 경우, 상대의 캐릭터 1장까지는 이번 턴 동안 파워 -3000.]],
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
    rules_id=[[EB04-008]],
    schema_version=1,
  })
end
