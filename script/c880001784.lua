-- AUTO-GENERATED: ST05-002 / 아인
-- rules_id=ST05-002 script_id=880001784 fingerprint=1917a095cec59e360a20a5084d7cc381964954cbd6ab8fe0a7442b4e25e17b38
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST05-002]],
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
        source_text=[[【등장 시】두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST05-002]],
    schema_version=1,
  })
end
