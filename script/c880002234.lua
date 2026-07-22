-- AUTO-GENERATED: OP14-069 / 돈키호테 도플라밍고
-- rules_id=OP14-069 script_id=880002234 fingerprint=e8338a1ffd07482fd2cf3f6586483408d30c6681afc3da599a820a99332bfc8a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-069]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[CHOOSE]],
            option_conditions={
              {
                {
                  op=[[LEADER_HAS_TRAIT]],
                  player=[[YOU]],
                  trait=[[돈키호테 해적단]],
                },
              },
              {},
            },
            options={
              {
                {
                  op=[[KO]],
                  selector={
                    count=1,
                    filter={
                      cost_lte=8,
                    },
                    kind=[[CHARACTER]],
                    mode=[[UP_TO]],
                    owner=[[OPPONENT]],
                  },
                },
              },
              {
                {
                  duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
                  op=[[CANNOT_BE_RESTED]],
                  reason=[[ANY]],
                  selector={
                    count=3,
                    filter={
                      cost_lte=7,
                    },
                    kind=[[CHARACTER]],
                    mode=[[UP_TO]],
                    owner=[[OPPONENT]],
                  },
                },
              },
            },
          },
        },
        conditions={},
        costs={
          {
            count=3,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!!-3: 아래에서 하나를 선택한다.
・자신의 리더가 《돈키호테 해적단》 특징을 가진 경우, 상대의 코스트 8 이하인 캐릭터 1장까지를 KO 시킨다.
・상대의 코스트 7 이하인 캐릭터 3장까지는, 다음 상대의 엔드 페이즈 종료 시까지, 레스트로 할 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-069]],
    schema_version=1,
  })
end
