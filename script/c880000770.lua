-- AUTO-GENERATED: OP06-036 / 류마
-- rules_id=OP06-036 script_id=880000770 fingerprint=2c380c963a9202e8238502c3dc5d047ebd7ed504a61abe9c576b176aebbb7cca
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-036]],
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
        source_text=[[【등장 시】/【KO 시】상대의 레스트 상태이고 코스트 4 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-036]],
    schema_version=1,
  })
end
