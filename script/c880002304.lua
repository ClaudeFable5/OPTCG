-- AUTO-GENERATED: OP15-002 / 루시
-- rules_id=OP15-002 script_id=880002304 fingerprint=ac8fb76131e7f75508e80da69757cafc2003f204c42efcca6aefd5dabc14fd3f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_BATTLE]],
            filter={
              card_type_any={
                [[EVENT]],
                [[STAGE]],
              },
            },
            op=[[TRASH_HAND_FOR_POWER]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】/【상대의 어택 시】자신의 패에서 이벤트나 스테이지 카드를 원하는 만큼 버릴 수 있다. 버린 카드 1장당, 이 리더는 이번 배틀 동안 파워 +1000.]],
        timings={
          [[WHEN_ATTACKING]],
          [[ON_OPPONENT_ATTACK]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            cost_gte=3,
            op=[[EVENT_ACTIVATED_THIS_TURN]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】이번 턴 동안 자신이 원래 코스트 3 이상인 이벤트를 발동했을 경우, 카드를 1장 뽑는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-002]],
    schema_version=1,
  })
end
