-- AUTO-GENERATED: EB04-034 / 샬롯 푸딩
-- rules_id=EB04-034 script_id=880002455 fingerprint=85cac38661bcba3ad494c453e7b3c41977b6e9d609de376fb85ccbbd1cced25d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-034]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
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
            count=4,
            filter={
              card_type=[[EVENT]],
            },
            op=[[TRASH_GTE]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【상대의 어택 시】【턴 1회】자신의 패 1장을 버릴 수 있다: 자신의 트래시에 이벤트가 4장 이상 있는 경우, 자신의 리더나 캐릭터 1장까지는 이번 배틀 동안 파워 +2000.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB04-034]],
    schema_version=1,
  })
end
