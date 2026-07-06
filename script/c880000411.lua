-- AUTO-GENERATED: OP03-045 / 카르네
-- rules_id=OP03-045 script_id=880000411 fingerprint=eec740664a84c2eeedb964868f9758f00149d62caa39d0aadac175ae70e76f4e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-045]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
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
            count=20,
            op=[[DECK_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】자신의 덱이 20장 이하인 경우, 이 캐릭터의 파워 +3000.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP03-045]],
    schema_version=1,
  })
end
