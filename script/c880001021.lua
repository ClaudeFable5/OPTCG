-- AUTO-GENERATED: OP08-045 / 삿치
-- rules_id=OP08-045 script_id=880001021 fingerprint=78dd48d47bfeb8afbeb74140fcedc80d06b21dbbf80614b9f03c6236120cb8a2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-045]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_LEAVE_FIELD]],
            optional=true,
            reason=[[KO_OR_OPPONENT_EFFECT]],
            replacement_actions={
              {
                count=1,
                op=[[DRAW]],
                player=[[YOU]],
              },
            },
            replacement_costs={
              {
                op=[[TRASH_SELF]],
              },
            },
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
        source_text=[[이 캐릭터가 KO 당할 경우 또는 상대의 효과로 필드를 벗어날 경우, 대신 이 캐릭터를 트래시에 놓고 카드를 1장 뽑는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-045]],
    schema_version=1,
  })
end
