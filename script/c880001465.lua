-- AUTO-GENERATED: OP12-012 / 버기
-- rules_id=OP12-012 script_id=880001465 fingerprint=810010178613ff333b6f1df8fd84f44e3f03414d53b0d1e4073953c51d2b9d9d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-012]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            keyword=[[BLOCKER]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              filter={
                name_neq=[[버기]],
                trait_contains=[[로저 해적단]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】다음 상대의 엔드 페이즈 종료 시까지, 자신의 「버기」 이외의 『로저 해적단』을 포함한 특징을 가진 캐릭터 1장까지는 【블로커】를 얻는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-012]],
    schema_version=1,
  })
end
