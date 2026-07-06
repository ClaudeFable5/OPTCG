-- AUTO-GENERATED: OP11-013 / 프린스 그루스
-- rules_id=OP11-013 script_id=880001347 fingerprint=15c403dd489846cec0c4fe812ad8f0a2eb15b247638c118478c0e5c264dac362
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-013]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            filter={
              power_lte=2000,
            },
            op=[[PREVENT_BLOCKER_ACTIVATION]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】이번 턴 동안, 상대의 파워 2000 이하인 모든 캐릭터는 【블로커】를 발동할 수 없다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-013]],
    schema_version=1,
  })
end
