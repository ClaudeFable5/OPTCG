-- AUTO-GENERATED: OP07-042 / 겟코 모리아
-- rules_id=OP07-042 script_id=880000897 fingerprint=16aa9bd372b4db1cf0bce0dbb5c203c352062d81670ad99287c6c5bd3c127576
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-042]],
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
                count=1,
                op=[[RETURN_OWN_CARD_TO_DECK_BOTTOM]],
                order=[[CHOOSE]],
                selector={
                  count=1,
                  filter={
                    name_neq=[[겟코 모리아]],
                  },
                  kind=[[CHARACTER]],
                  mode=[[EXACT]],
                  owner=[[YOU]],
                },
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
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[왕의 부하 칠무해]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【턴 1회】자신의 리더가 《왕의 부하 칠무해》 특징을 가지고, 이 캐릭터가 상대의 효과로 필드를 벗어날 경우, 대신 자신의 「겟코 모리아」 이외의 캐릭터 1장을 주인의 덱 맨 아래로 되돌릴 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-042]],
    schema_version=1,
  })
end
