-- AUTO-GENERATED: OP04-016 / 안티 매너 킥 코스
-- rules_id=OP04-016 script_id=880000506 fingerprint=bf274f26bd950877bf7a7bdac43a132de977c6c0c67bae1b050c0005ebe8d0b2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-016]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3000,
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
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】자신의 패 1장을 버릴 수 있다: 이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +3000.]],
        timings={
          [[COUNTER]],
        },
      },
      {
        actions={
          {
            amount=-3000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이번 턴 동안, 상대의 리더 또는 캐릭터 1장까지의 파워 -3000.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-016]],
    schema_version=1,
  })
end
