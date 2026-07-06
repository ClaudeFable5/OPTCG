-- AUTO-GENERATED: OP04-003 / 우솝
-- rules_id=OP04-003 script_id=880000493 fingerprint=cd726abef92b9792c524bd52f9978688fbe1fea5f3b8af106c164e792b825dfb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                base_power_lte=5000,
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
        source_text=[[【KO 시】상대의 원래 파워가 5000 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-003]],
    schema_version=1,
  })
end
