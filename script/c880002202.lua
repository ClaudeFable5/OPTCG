-- AUTO-GENERATED: OP14-037 / 심심풀이
-- rules_id=OP14-037 script_id=880002202 fingerprint=043d2fa5eb933b1b27ccba6546d76ec85391098d1a3464943b1079302b005ac9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-037]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                base_power_lte=7000,
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=3,
            op=[[REST_OWN_CARD]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 카드 3장을 레스트로 할 수 있다: 상대의 레스트 상태인 원래 파워가 7000 이하인 캐릭터 1장까지를 KO 시킨다.]],
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
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【카운터】이번 배틀 동안, 자신의 리더의 파워 +3000.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-037]],
    schema_version=1,
  })
end
