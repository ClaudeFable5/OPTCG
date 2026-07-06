-- AUTO-GENERATED: ST12-003 / 쥬라큘 미호크
-- rules_id=ST12-003 script_id=880001885 fingerprint=aa0c011235905c950e214821349a8d8914e408165c6f82117639622933dc93ee
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST12-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              any={
                {
                  trait=[[스파다우 왕국]],
                },
                {
                  attribute=[[SLASH]],
                },
              },
              card_type=[[CHARACTER]],
              cost_lte=4,
              name_neq=[[쥬라큘 미호크]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=true,
          },
        },
        conditions={
          {
            count=2,
            op=[[CHARACTER_COUNT_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 캐릭터가 2장 이하인 경우, 자신의 패에서 「쥬라큘 미호크」 이외의 코스트 4 이하인 《스파다우 왕국》 특징이나 <참격> 속성을 가진 캐릭터 카드를 1장까지 레스트 상태로 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST12-003]],
    schema_version=1,
  })
end
