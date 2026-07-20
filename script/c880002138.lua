-- AUTO-GENERATED: EB03-035 / 샬롯 푸딩
-- rules_id=EB03-035 script_id=880002138 fingerprint=213c898be9cacda5a5a01c2a196f383827cb796c5c325776b62f56594d6644b1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-035]],
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
        conditions={
          {
            op=[[FIELD_DON_LTE_OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신 필드의 두웅!!이 상대 필드의 두웅!! 수 이하인 경우, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB03-035]],
    schema_version=1,
  })
end
