-- AUTO-GENERATED: ST01-012 / 몽키 D. 루피
-- rules_id=ST01-012 script_id=880001723 fingerprint=7de07bc8f75189df6cc15f3da3ce71959ba0eadca0b6ba91138a17a95ea04292
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST01-012]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_BATTLE]],
            op=[[PREVENT_BLOCKER_ACTIVATION]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        don_attached=2,
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【두웅!!x2】【어택 시】이번 배틀 중, 상대는 【블로커】를 발동할 수 없다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={
      [[RUSH]],
    },
    rules_id=[[ST01-012]],
    schema_version=1,
  })
end
