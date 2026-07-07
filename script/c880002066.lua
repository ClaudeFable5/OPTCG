-- AUTO-GENERATED: P-093 / 트라팔가 로
-- rules_id=P-093 script_id=880002066 fingerprint=f8a9420d5df286f9db4b842529de9c9e49a7b949cec1d1f97a2eb907822c2cf4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-093]],
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
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
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
    rules_id=[[P-093]],
    schema_version=1,
  })
end
