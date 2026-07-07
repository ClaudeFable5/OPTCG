-- AUTO-GENERATED: P-107 / 골 D. 로저
-- rules_id=P-107 script_id=880002069 fingerprint=79aab875d1ab04f929cd1fe8c9f9429098617748d5377317154b758b8561ca94
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-107]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=10,
            op=[[ANY_FIELD_DON_EQ]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신 또는 상대 필드의 두웅!!이 10장인 경우, 다음 상대의 엔드 페이즈 종료 시까지, 자신의 리더의 파워 +2000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[P-107]],
    schema_version=1,
  })
end
