-- AUTO-GENERATED: OP01-113 / 홀덤
-- rules_id=OP01-113 script_id=880000236 fingerprint=48e6fb1a979fcd0b757bccb156dd6555c2102d32932b8e0e9df0e5ed2c3bb3a2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-113]],
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
        source_text=[[【KO 시】두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-113]],
    schema_version=1,
  })
end
