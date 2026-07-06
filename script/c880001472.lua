-- AUTO-GENERATED: OP12-019 / 무장색 패기
-- rules_id=OP12-019 script_id=880001472 fingerprint=5cd54f77a558c9cf6ece71dc9d9955b2e00d45717768b7ce0a5f703b8621df1e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-019]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
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
        source_text=[[【메인】자신의 「실버즈 레일리」 1장에게 액티브 상태인 두웅!! 1장을 부여할 수 있다: 이번 턴 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +1000.]],
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
        source_text=[[【카운터】이번 배틀 동안, 자신의 캐릭터 또는 「실버즈 레일리」 1장까지의 파워 +2000.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-019]],
    schema_version=1,
  })
end
