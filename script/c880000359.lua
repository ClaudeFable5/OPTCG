-- AUTO-GENERATED: OP02-114 / 볼사리노
-- rules_id=OP02-114 script_id=880000359 fingerprint=3ddaaec677f9e4817e89b9fe53c1c998d641bbd762beee6a1bffd7dec5313b21
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-114]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_BE_KO]],
            reason=[[EFFECT]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            amount=1000,
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
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】이 캐릭터는 효과로는 KO 당하지 않으며, 파워 +1000.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP02-114]],
    schema_version=1,
  })
end
