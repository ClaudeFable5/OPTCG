-- AUTO-GENERATED: OP07-033 / 몽키 D. 루피
-- rules_id=OP07-033@890c12bf0f22 script_id=880000888 fingerprint=890c12bf0f22cf0b7c40cc79bc0b3e09961b2ba31d5aaf19ba17e03e385d8012
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-033]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_BE_KO]],
            reason=[[OPPONENT_EFFECT]],
            selector={
              count=0,
              filter={
                cost_lte=3,
                name_neq=[[몽키 D. 루피]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=3,
            op=[[CHARACTER_COUNT_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 캐릭터가 3장 이상인 경우,]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-033@890c12bf0f22]],
    schema_version=1,
  })
end
