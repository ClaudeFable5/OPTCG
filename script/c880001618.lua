-- AUTO-GENERATED: OP13-046 / 비스타
-- rules_id=OP13-046 script_id=880001618 fingerprint=46cf388933536033fab0b4324af94d7a7b1d1e9b3713337ced1b945c41e4e1a9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-046]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_LEAVE_FIELD]],
            optional=true,
            reason=[[KO_OR_OPPONENT_EFFECT]],
            replacement_costs={
              {
                count=1,
                filter={
                  trait_contains=[[흰 수염 해적단]],
                },
                op=[[TRASH_HAND]],
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
        source_text=[[【턴 1회】이 캐릭터가 KO 당하거나 상대의 효과로 필드를 벗어날 경우, 대신 자신의 패에서 『흰 수염 해적단』을 포함한 특징을 가진 카드 1장을 버릴 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={
      [[DOUBLE_ATTACK]],
    },
    rules_id=[[OP13-046]],
    schema_version=1,
  })
end
