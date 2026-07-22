-- AUTO-GENERATED: OP14-111 / 페로나
-- rules_id=OP14-111 script_id=880002276 fingerprint=78936b6e962ab9390d4eab2184a0788aef0265f68b1b273d9580810e291ab1bb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-111]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[CANNOT_ATTACK]],
            selector={
              count=1,
              filter={
                cost_lte=6,
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
        source_text=[[【등장 시】/【KO 시】상대의 코스트 6 이하인 캐릭터 1장까지는, 다음 상대의 엔드 페이즈 종료 시까지, 어택할 수 없다.]],
        timings={
          [[ON_PLAY]],
          [[ON_KO]],
        },
      },
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              trait=[[스릴러 바크 해적단]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 트래시에서 코스트 4 이하인 《스릴러 바크 해적단》 특징을 가진 캐릭터 카드 1장까지를 레스트로 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-111]],
    schema_version=1,
  })
end
