-- AUTO-GENERATED: OP15-019 / 배리어 돌진우
-- rules_id=OP15-019 script_id=880002321 fingerprint=4ac33a6ea88a79ceb7139c9fb72e96be0f9fe9ddd2084883f22960a2aea7e339
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-019]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            amount=1000,
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】카드를 1장 뽑고, 자신의 리더는 다음 상대의 엔드 페이즈 종료 시까지 파워 +1000.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            amount=-4000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】상대의 캐릭터 1장까지는 이번 턴 동안 파워 -4000.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-019]],
    schema_version=1,
  })
end
