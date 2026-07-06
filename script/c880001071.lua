-- AUTO-GENERATED: OP08-095 / 철괴 아섬
-- rules_id=OP08-095 script_id=880001071 fingerprint=1c48160bb540a5422da1601d463947800e4f25cce5fb0818c1a7ecb19c3bda2b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-095]],
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
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=10,
            op=[[TRASH_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 트래시가 10장 이상인 경우, 다음 상대의 턴 종료 시까지, 자신의 캐릭터 1장까지의 파워 +2000.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            amount=2000,
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
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이번 턴 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +2000.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-095]],
    schema_version=1,
  })
end
