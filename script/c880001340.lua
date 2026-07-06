-- AUTO-GENERATED: OP11-006 / 제트
-- rules_id=OP11-006 script_id=880001340 fingerprint=72e4d240425eddf4280e75ee8d05d2fcda5b74ca05474d55b883a50f830714e0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-006]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-5000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                attribute=[[SPECIAL]],
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
        source_text=[[【두웅!!×1】【어택 시】이번 턴 동안, 상대의 <특수> 속성을 가진 캐릭터 1장까지의 파워 -5000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-006]],
    schema_version=1,
  })
end
