-- AUTO-GENERATED: OP05-100 / 에넬
-- rules_id=OP05-100 script_id=880000713 fingerprint=8b4788173eae85342ee525cd14cca972f847b4d126e7474fe9fab647a19ac5da
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-100]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            disabled_if={
              {
                filter={
                  name=[[몽키 D. 루피]],
                },
                op=[[CHARACTER_EXISTS]],
                player=[[YOU]],
              },
            },
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_LEAVE_FIELD]],
            optional=true,
            reason=[[ANY]],
            replacement_costs={
              {
                count=1,
                op=[[TRASH_LIFE_TOP]],
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
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【턴 1회】이 캐릭터가 필드를 벗어날 경우, 대신 자신의 라이프 위에서 1장을 트래시에 놓을 수 있다. 캐릭터인 「몽키 D. 루피」가 있을 경우, 이 효과는 무효가 된다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={
      [[RUSH]],
    },
    rules_id=[[OP05-100]],
    schema_version=1,
  })
end
