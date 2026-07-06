-- AUTO-GENERATED: OP09-026 / 사카즈키
-- rules_id=OP09-026 script_id=880001121 fingerprint=160ec8748a153d82c8ceff63998197070ebd98be90517056057ddb7ee75f6ec8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-026]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=5,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            count=2,
            op=[[CHARACTER_COUNT_GTE]],
            player=[[YOU]],
            state=[[RESTED]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 레스트 상태인 캐릭터가 2장 이상인 경우, 상대의 코스트 5 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-026]],
    schema_version=1,
  })
end
