-- AUTO-GENERATED: OP15-038 / 명령하는거다 누구도 날 거역할 수 없어!!!
-- rules_id=OP15-038 script_id=880002340 fingerprint=085fba86175a1508164d1566e89927ff2027a2bfa35dc71fc41a97d979c3d4d4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-038]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_REFRESH]],
            op=[[CANNOT_SET_ACTIVE]],
            selector={
              count=1,
              filter={
                cost_lte=8,
                don_gte=2,
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】상대의 두웅!!이 2장 이상 부여된 레스트 상태인 코스트 8 이하의 캐릭터 1장까지는 다음 상대의 리프레시 페이즈에 액티브가 되지 않는다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            amount=4000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                name=[[클리크]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【카운터】자신의 「클리크」 1장까지는 이번 배틀 동안 파워 +4000.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-038]],
    schema_version=1,
  })
end
