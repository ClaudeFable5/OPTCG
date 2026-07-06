-- AUTO-GENERATED: OP09-009 / 벤 베크맨
-- rules_id=OP09-009 script_id=880001104 fingerprint=833139222da39dce2ab8c8bc38da182c6025ee5e14559a9ee981ce51a9529795
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-009]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[TRASH]],
            selector={
              count=1,
              filter={
                power_lte=6000,
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
        source_text=[[【등장 시】상대의 파워 6000 이하인 캐릭터를 1장까지 트래시로 보낸다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-009]],
    schema_version=1,
  })
end
