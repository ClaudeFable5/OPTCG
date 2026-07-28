-- AUTO-GENERATED: OP15-094 / 롤로노아 조로
-- rules_id=OP15-094 script_id=880002396 fingerprint=976d85f68bcec3fef04562a7918ecdcac0bbf3fa171cc7ab0ecbf3c1577ff646
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-094]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_LEAVE_FIELD]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_costs={
              {
                op=[[TRASH_SELF]],
              },
            },
            selector={
              count=1,
              filter={
                exclude_self=true,
                trait=[[밀짚모자 일당]],
              },
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
        source_text=[[이 캐릭터 이외의 자신의 《밀짚모자 일당》 특징을 가진 캐릭터가 상대의 효과로 필드를 벗어날 경우, 대신 이 캐릭터를 트래시에 놓을 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP15-094]],
    schema_version=1,
  })
end
