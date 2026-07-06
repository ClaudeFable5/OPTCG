-- AUTO-GENERATED: PRB02-018 / 포트거스 D. 에이스
-- rules_id=PRB02-018 script_id=880001709 fingerprint=5e14ec6e6b4f1b257e6a126b32c2f29de58d27a6b7791f0f579e46261bacc68f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[PRB02-018]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              any={
                {
                  name=[[사보]],
                },
                {
                  name=[[포트거스 D. 에이스]],
                },
                {
                  name=[[몽키 D. 루피]],
                },
              },
              cost_eq=2,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND_OR_TRASH]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            op=[[FACEUP_LIFE_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 앞면인 라이프가 있을 경우, 자신의 패 또는 트래시에서 코스트 2인 「사보」 또는 「포트거스 D. 에이스」 또는 「몽키 D. 루피」를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[PRB02-018]],
    schema_version=1,
  })
end
