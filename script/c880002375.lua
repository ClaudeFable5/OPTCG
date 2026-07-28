-- AUTO-GENERATED: OP15-073 / 야마
-- rules_id=OP15-073 script_id=880002375 fingerprint=fab4883ff9c38454ef5137b1c42cdf6ef4da2a0413324fa57f75d9f7ce6d79d6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-073]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              any={
                {
                  name=[[신병]],
                },
                {
                  trait=[[신관]],
                },
              },
              card_type=[[CHARACTER]],
              cost_eq=1,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 코스트 1인 「신병」이나 《신관》 특징을 가진 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP15-073]],
    schema_version=1,
  })
end
