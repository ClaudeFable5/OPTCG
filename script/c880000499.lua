-- AUTO-GENERATED: OP04-009 / 초 카루가모 부대
-- rules_id=OP04-009 script_id=880000499 fingerprint=5327b0635768b1252903786eff797d5872ba2cc1c916e3f628de62766e2e7c38
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-009]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            schedule=[[THIS_TURN_END]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            amount=-5000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_OWN_POWER]],
            selector={
              count=1,
              filter={
                state=[[ACTIVE]],
              },
              kind=[[LEADER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】이번 턴 동안, 자신의 액티브 상태인 리더 1장의 파워를 -5000 할 수 있다: 이번 턴 종료 시, 이 캐릭터를 주인의 패로 되돌린다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-009]],
    schema_version=1,
  })
end
