-- AUTO-GENERATED: OP10-099 / 유스타스 키드
-- rules_id=OP10-099 script_id=880001314 fingerprint=f1ecd536f88ecdaf2b760a3139c23e9ff80b6dead04f4b5130f04ef53251c3a8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-099]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                cost_gte=3,
                cost_lte=8,
                trait=[[초신성]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            keyword=[[BLOCKER]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[LAST_TARGET]],
              mode=[[UP_TO]],
              owner=[[CONTEXT]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            faceup=true,
            op=[[FLIP_LIFE_TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 라이프 위에서 1장을 앞면으로 할 수 있다: 자신의 코스트 3에서 8인 《초신성》 특징을 가진 캐릭터를 1장까지 액티브로 하고, 다음 상대의 턴 종료 시까지, 그 캐릭터는 【블로커】를 얻는다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-099]],
    schema_version=1,
  })
end
