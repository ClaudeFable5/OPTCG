-- AUTO-GENERATED: OP15-055 / 써주시라요!! 루피 선배!!!
-- rules_id=OP15-055 script_id=880002357 fingerprint=ae4777cb317eaa2e84aa86f02d8ffcd553b18d486a54a5ca474a1a730acf7359
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-055]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[CHOOSE]],
            options={
              {
                {
                  count=2,
                  op=[[DRAW]],
                  player=[[YOU]],
                },
              },
              {
                {
                  duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
                  keyword=[[BLOCKER]],
                  op=[[GAIN_KEYWORD]],
                  selector={
                    count=1,
                    filter={
                      trait=[[드레스로자]],
                    },
                    kind=[[CHARACTER]],
                    mode=[[UP_TO]],
                    owner=[[YOU]],
                  },
                },
              },
            },
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】이하에서 1개를 고른다. ·카드를 2장 뽑는다. ·자신의 《드레스로자》 특징을 가진 캐릭터 1장까지는 다음 상대의 엔드 페이즈 종료 시까지 【블로커】를 얻는다.]],
        timings={
          [[MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-055]],
    schema_version=1,
  })
end
