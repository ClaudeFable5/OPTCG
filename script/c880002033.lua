-- AUTO-GENERATED: P-031 / 우타
-- rules_id=P-031 script_id=880002033 fingerprint=c7c42a8d88a4b649d52bfc981e672660394335424a935e24e329e6b79d8482d4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-031]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[P-031]],
    schema_version=1,
  })
end
