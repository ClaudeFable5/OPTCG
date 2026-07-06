-- AUTO-GENERATED: ST26-005 / 몽키 D. 루피
-- rules_id=ST26-005 script_id=880001994 fingerprint=3388278bc5237a36227e8af3e520cd7bc765d30f0ec23bb4b18880971f72ffc9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST26-005]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[SET_BASE_POWER]],
            selector={
              count=1,
              filter={
                trait=[[밀짚모자 일당]],
              },
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            value=7000,
          },
        },
        conditions={
          {
            op=[[LEADER_IS_MULTICOLOR]],
            player=[[YOU]],
          },
          {
            count=5,
            op=[[FIELD_DON_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={
          {
            count=2,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】/【어택 시】두웅!!-2(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 자신의 리더가 다색이고, 상대 필드의 두웅!!이 5장 이상인 경우, 다음 상대의 엔드 페이즈 종료 시까지, 자신의 《밀짚모자 일당》 특징을 가진 리더의 원래 파워를 7000으로 한다.]],
        timings={
          [[ON_PLAY]],
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST26-005]],
    schema_version=1,
  })
end
