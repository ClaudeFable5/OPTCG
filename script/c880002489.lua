-- AUTO-GENERATED PROMO: P-040 / 카이도
-- rules_id=P-040 script_id=880002489
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-040]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_BE_KO]],
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
            count=10,
            op=[[FIELD_DON_EQ]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[상대의 필드에 두웅!!이 10장인 경우, 이 캐릭터는 KO 당하지 않는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[P-040]],
    schema_version=1,
  })
end
