-- AUTO-GENERATED: OP03-002 / 아디오
-- rules_id=OP03-002 script_id=880000368 fingerprint=c4823f0d24978bc0e97ef453b50f58f4539df3f79444e39790f41f034e972645
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_BATTLE]],
            filter={
              power_lte=2000,
            },
            op=[[PREVENT_BLOCKER_ACTIVATION]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】이번 배틀 동안, 상대는 파워 2000 이하인 캐릭터의 【블로커】를 발동할 수 없다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-002]],
    schema_version=1,
  })
end
