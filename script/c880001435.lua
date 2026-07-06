-- AUTO-GENERATED: OP11-101 / 카포네 벳지
-- rules_id=OP11-101 script_id=880001435 fingerprint=67d0fae0e4ef27162fdd70b2b1e8a10a85cdbc1c9bbf4473b83e380214cdde44
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-101]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_LEAVE_FIELD]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_actions={
              {
                faceup=false,
                op=[[ADD_TO_LIFE]],
                player=[[YOU]],
                positions={
                  [[LIFE_TOP]],
                },
                selector={
                  count=1,
                  kind=[[EVENT_TARGET]],
                  mode=[[EXACT]],
                  owner=[[CONTEXT]],
                },
              },
            },
            replacement_costs={},
            selector={
              count=0,
              filter={
                name_neq=[[카포네 벳지]],
                trait=[[초신성]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【턴 1회】「카포네 벳지」 이외의 자신의 《초신성》 특징을 가진 캐릭터가 상대의 효과로 필드를 벗어날 경우, 대신 자신의 라이프 맨 위에 뒷면으로 더할 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP11-101]],
    schema_version=1,
  })
end
