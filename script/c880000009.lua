-- AUTO-GENERATED: EB01-010 / 네가 나한테!!! 이길 수 있을 리가 없잖아!!!!
-- rules_id=EB01-010 script_id=880000009 fingerprint=9d5dd0aaa2167571a397870a9db7fb4f4f5026f182f0917ad8b915e19dec1b9d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-010]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                base_power_lte=6000,
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
        source_text=[[【카운터】상대의 원래 파워가 6000 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[COUNTER]],
        },
      },
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
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[상대의 원래 파워가 5000 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-010]],
    schema_version=1,
  })
end
