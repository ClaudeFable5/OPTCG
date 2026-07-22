-- AUTO-GENERATED: OP14-098 / 초승달 모양 사구
-- rules_id=OP14-098 script_id=880002263 fingerprint=93c6d87b00cb1aaad98a124898132ba6b42c237dabc4068905b827f9e2a5ec37
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-098]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3,
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[MODIFY_COST]],
            selector={
              count=0,
              filter={
                trait_contains=[[바로크 워크스]],
              },
              kind=[[CHARACTER]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            filter={
              any={
                {
                  cost_eq=0,
                },
                {
                  cost_gte=8,
                },
              },
            },
            op=[[CHARACTER_EXISTS]],
            player=[[ANY]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】코스트 0이나 8 이상인 캐릭터가 있는 경우, 자신의 『바로크 워크스』를 포함한 특징을 가진 모든 캐릭터를, 다음 상대의 엔드 페이즈 종료 시까지, 코스트 +3.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【카운터】이번 배틀 동안, 자신의 리더의 파워 +3000.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-098]],
    schema_version=1,
  })
end
