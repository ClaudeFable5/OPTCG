-- AUTO-GENERATED PROMO: P-111 / 니코 로빈
-- rules_id=P-111 script_id=880002524
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-111]],
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
                op=[[REST_DON]],
              },
            },
            selector={
              count=0,
              filter={
                trait=[[밀짚모자 일당]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【턴 1회】자신의 《밀짚모자 일당》 특징을 가진 캐릭터가 상대의 효과로 필드를 벗어날 경우, 대신 자신의 두웅!! 1장을 레스트로 할 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[P-111]],
    schema_version=1,
  })
end
