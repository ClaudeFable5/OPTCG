-- AUTO-GENERATED: OP15-029 / 바솔로뮤 쿠마
-- rules_id=OP15-029 script_id=880002331 fingerprint=38cc9b347e5bc73eee9b6e43ca5150a105bb821143e2ae909ef13c7832e0d7bf
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-029]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[CANNOT_BE_RESTED]],
            selector={
              count=1,
              filter={
                cost_lte=5,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 코스트 5 이하인 캐릭터 1장까지는 다음 상대의 엔드 페이즈 종료 시까지 레스트로 할 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-029]],
    schema_version=1,
  })
end
