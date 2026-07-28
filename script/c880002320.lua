-- AUTO-GENERATED: OP15-018 / 모디
-- rules_id=OP15-018 script_id=880002320 fingerprint=f3e08cad9b7e658bab497fa5a6f2fe373c8fce7020b8931cd9475d4211431a01
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-018]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                don_given=true,
                power_lte=3000,
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
        source_text=[[【어택 시】상대의 두웅!!이 부여된 파워 3000 이하인 캐릭터 1장까지를 KO한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-018]],
    schema_version=1,
  })
end
