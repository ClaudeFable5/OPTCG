-- AUTO-GENERATED: P-010 / 카이도
-- rules_id=P-010 script_id=880002014 fingerprint=d6c66598e77c68b8efecadd4f64ac3b7c5cd89195b8b35a123aa5da3ee56d74d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-010]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[ACTIVE]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】 두웅!! 덱에서 두웅!!을 1장까지 액티브로 추가한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[P-010]],
    schema_version=1,
  })
end
