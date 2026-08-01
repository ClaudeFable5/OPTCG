-- AUTO-GENERATED PROMO: PRB01-001 / 상디
-- rules_id=PRB01-001 script_id=880002538
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[PRB01-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[RUSH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              filter={
                cost_lte=8,
                no_on_play_effect=true,
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
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 코스트 8 이하인 【등장 시】 효과를 가지지 않은 캐릭터 1장까지는, 이번 턴 동안, 【속공】을 얻는다.(이 카드는 등장한 턴에 어택할 수 있다.)]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[PRB01-001]],
    schema_version=1,
  })
end
