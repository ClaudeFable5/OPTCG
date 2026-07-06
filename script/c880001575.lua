-- AUTO-GENERATED: OP13-003 / 골 D. 로저
-- rules_id=OP13-003 script_id=880001575 fingerprint=219832e58e4e28fab92cd7590d08b186e77d584704f1138a4ad78b102982a153
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            conditions={
              {
                count=1,
                op=[[FIELD_DON_GTE]],
                player=[[YOU]],
              },
            },
            count=1,
            duration=[[WHILE_CONDITION]],
            op=[[DON_PHASE_ATTACH_TO_LEADER]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신 필드에 두웅!!이 있을 경우, 자신의 두웅!! 페이즈에 놓이는 두웅!! 1장은 자신의 리더에게 부여된다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            amount=-2000,
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
            count=9,
            op=[[FIELD_DON_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[자신 필드의 두웅!!이 9장 이하인 경우, 이 리더의 파워 -2000.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-003]],
    schema_version=1,
  })
end
