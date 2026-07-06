-- AUTO-GENERATED: OP01-106 / 바질 호킨스
-- rules_id=OP01-106 script_id=880000229 fingerprint=405223a571b9371a294fb1f73aaaddbcfdd1e876321c6e8e17b9f55a6a0a7c4d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-106]],
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
    rules_id=[[OP01-106]],
    schema_version=1,
  })
end
