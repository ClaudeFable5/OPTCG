-- AUTO-GENERATED PROMO: PRB01-001 / 상디
-- rules_id=PRB01-001 script_id=880002538
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[PRB01-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={},
        conditions={
          {
            count=99,
            op=[[CHARACTER_COUNT_GTE]],
            player=[[YOU]],
            reason=[[GAIN_RUSH_FILTER_NO_ON_PLAY_EFFECT]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】【턴 1회】자신의 코스트 8 이하인 【등장 시】 효과를 가지지 않은 캐릭터 1장까지는, 이번 턴 동안, 【속공】을 얻는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[PRB01-001]],
    schema_version=1,
  })
end
