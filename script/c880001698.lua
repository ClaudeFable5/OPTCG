-- AUTO-GENERATED: PRB02-006 / 롤로노아 조로
-- rules_id=PRB02-006 script_id=880001698 fingerprint=adb9fc95aec51f42513ae0617e10638d69c887469290c93c4f8bfc32f3743f85
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[PRB02-006]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_REST]],
            optional=true,
            reason=[[OPPONENT_CHARACTER_EFFECT]],
            replacement_costs={
              {
                count=1,
                filter={
                  exclude_self=true,
                },
                kinds={
                  [[CHARACTER]],
                },
                op=[[REST_OWN_CARD]],
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
        source_text=[[【상대의 턴 동안】이 캐릭터가 상대의 캐릭터의 효과로 레스트될 경우, 대신 자신의 다른 캐릭터 1장을 레스트할 수 있다.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[PRB02-006]],
    schema_version=1,
  })
end
