-- AUTO-GENERATED: ST10-009 / 잠발
-- rules_id=ST10-009 script_id=880001869 fingerprint=682696606af76afa32ef3ff7c7683c9cf5a58b6062ddf34cde917f42c9800f84
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST10-009]],
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
        costs={
          {
            count=1,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】1(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다): 두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST10-009]],
    schema_version=1,
  })
end
