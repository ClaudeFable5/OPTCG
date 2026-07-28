-- AUTO-GENERATED: OP15-036 / 류마
-- rules_id=OP15-036 script_id=880002338 fingerprint=9223e1deeb088eea52e7aa6a394f34d61b6e2662e15c20b7d977f304ed5d5b47
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-036]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=4,
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】/【어택 시】상대의 레스트 상태인 코스트 4 이하의 캐릭터 1장까지를 KO한다.]],
        timings={
          [[ON_PLAY]],
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-036]],
    schema_version=1,
  })
end
