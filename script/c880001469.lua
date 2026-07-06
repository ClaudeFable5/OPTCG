-- AUTO-GENERATED: OP12-016 / '의심하지 않는 것', 그것이 '강함'이다!!!
-- rules_id=OP12-016 script_id=880001469 fingerprint=a134c0f2ea2dbf5200aa37b1099a71e1785dd800c68d215e1d8c9a12eb9f2f7d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-016]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            attacker_selector={
              count=1,
              kind=[[LAST_TARGET]],
              mode=[[UP_TO]],
              owner=[[CONTEXT]],
            },
            duration=[[THIS_TURN]],
            op=[[PREVENT_BLOCKER_ACTIVATION]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={
          {
            count=2,
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
        source_text=[[【메인】자신의 「실버즈 레일리」 1장에게 액티브 상태인 두웅!! 2장을 부여할 수 있다: 이번 턴 동안, 상대는 그 부여한 카드가 어택할 경우 【블로커】를 발동할 수 없다.]],
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
    rules_id=[[OP12-016]],
    schema_version=1,
  })
end
