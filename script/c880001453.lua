-- AUTO-GENERATED: OP11-119 / 코비
-- rules_id=OP11-119 script_id=880001453 fingerprint=c5db65b70b41a4de5d3b3fd5888f08aa56c83a4c2b78c40fdab9d0134907e6d6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-119]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[ALLOW_ATTACK_ACTIVE_CHARACTER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】이번 턴 동안, 자신의 캐릭터 1장까지는 액티브 상태인 캐릭터도 어택할 수 있다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            amount=1000,
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
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
            count=2,
            filter={},
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 트래시에서 카드 2장을 원하는 순서대로 덱 맨 아래로 되돌릴 수 있다: 다음 상대의 턴 종료 시까지, 자신의 리더 또는 캐릭터 1장까지의 파워 +1000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-119]],
    schema_version=1,
  })
end
