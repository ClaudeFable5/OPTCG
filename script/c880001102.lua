-- AUTO-GENERATED: OP09-007 / 히트
-- rules_id=OP09-007 script_id=880001102 fingerprint=c84f3303aed963275bf11081082962e85f6a3f4bb20d215706f276a421d7e4ed
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-007]],
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
              filter={
                power_lte=4000,
              },
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】이번 턴 동안, 자신의 파워 4000 이하인 리더 1장까지의 파워 +1000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP09-007]],
    schema_version=1,
  })
end
