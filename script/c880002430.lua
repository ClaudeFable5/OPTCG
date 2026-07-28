-- AUTO-GENERATED: EB04-009 / 제자의 출항이다 잘 좀 부탁하네···
-- rules_id=EB04-009 script_id=880002430 fingerprint=ffaca6a5f42c80471df6e9a2b58e1ac8b4432ea2c53ab6c0a7323b9451471b80
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-009]],
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
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[GIVE_DON]],
            selector={
              count=1,
              filter={
                name=[[실버즈 레일리]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
            state=[[ACTIVE]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 「실버즈 레일리」 1장에 액티브 상태인 두웅!! 1장을 부여할 수 있다: 상대의 캐릭터 1장까지는 이번 턴 동안 파워 -2000.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                any={
                  {
                    card_type=[[CHARACTER]],
                  },
                  {
                    name=[[실버즈 레일리]],
                  },
                },
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
        source_text=[[【카운터】자신의 캐릭터나 「실버즈 레일리」 1장까지는 이번 배틀 동안 파워 +2000.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-009]],
    schema_version=1,
  })
end
