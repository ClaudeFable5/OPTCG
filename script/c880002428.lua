-- AUTO-GENERATED: EB04-007 / 롤로노아 조로
-- rules_id=EB04-007 script_id=880002428 fingerprint=8fc6d8a576b6ca36d5d2da9453031c0f2a32d777e4ebe3da6695b5b0a9b63293
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-007]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
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
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더는 다음 상대의 엔드 페이즈 종료 시까지 파워 +2000.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[ALLOW_ATTACK_CHARACTER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=1,
            filter={
              power_gte=8000,
            },
            op=[[CHARACTER_COUNT_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】상대의 파워 8000 이상인 캐릭터가 있는 경우, 이 캐릭터는 이번 턴 동안 【속공: 캐릭터】를 얻는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-007]],
    schema_version=1,
  })
end
