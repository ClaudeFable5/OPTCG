-- AUTO-GENERATED: P-009 / 트라팔가 로
-- rules_id=P-009 script_id=880002013 fingerprint=e85146fbca74259cf18432d8b982f94ab26cef3ee09ed0fa560c82885b8d87e4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-009]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            player=[[OPPONENT]],
            position=[[TOP]],
          },
        },
        conditions={
          {
            count=6,
            op=[[HAND_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 패가 6장 이상 있는 경우 상대는 자신의 라이프 위에서 1장을 패에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[P-009]],
    schema_version=1,
  })
end
