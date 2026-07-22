-- AUTO-GENERATED: OP14-002 / 우루지
-- rules_id=OP14-002 script_id=880002167 fingerprint=0f80fb9eea910aeab528c5bdf92dd3c13f228a9e32af132eb386e0ff4c1c6cf5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                base_power_lte=3000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            amount=5000,
            op=[[SELF_POWER_GTE]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】이 캐릭터의 파워가 5000 이상인 경우, 카드를 1장 뽑고, 상대의 원래 파워가 3000 이하인 캐릭터 1장까지를 KO 시킨다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-002]],
    schema_version=1,
  })
end
