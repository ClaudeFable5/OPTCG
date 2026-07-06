-- AUTO-GENERATED: ST10-006 / 몽키 D. 루피
-- rules_id=ST10-006 script_id=880001866 fingerprint=124c879468e1bea3e1f3fce2bf6db01c7a05422904f3cad361d6f31d5b4b7d40
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST10-006]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                power_lte=8000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【턴 1회】상대가 【블로커】를 발동했을 때, 상대의 파워 8000 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_OPPONENT_BLOCKER_ACTIVATED]],
        },
      },
    },
    keywords={
      [[RUSH]],
    },
    rules_id=[[ST10-006]],
    schema_version=1,
  })
end
