-- AUTO-GENERATED: OP02-034 / 토니토니 쵸파
-- rules_id=OP02-034 script_id=880000278 fingerprint=c37b97c24be675e3e66eafd339464d4d0944c7a2853b1af07d53d2030ecf815d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-034]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=2,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】상대의 코스트 2 이하인 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-034]],
    schema_version=1,
  })
end
