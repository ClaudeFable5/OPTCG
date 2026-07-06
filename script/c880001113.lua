-- AUTO-GENERATED: OP09-018 / 꺼져
-- rules_id=OP09-018 script_id=880001113 fingerprint=76e7a8aee065b6ab614c572e9dcd9e0e41ff079f0789d175232e48c1bec5cc99
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-018]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=2,
              filter={
                power_sum_lte=4000,
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
        source_text=[[【메인】상대의 캐릭터 2장까지를 파워의 합계가 4000 이하가 되도록 KO 시킨다.]],
        timings={
          [[MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-018]],
    schema_version=1,
  })
end
