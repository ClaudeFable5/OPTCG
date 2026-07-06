-- AUTO-GENERATED: OP03-080 / 카쿠
-- rules_id=OP03-080 script_id=880000446 fingerprint=aace02d240ec51629592592ea02353e88c3142b742760d4ae75895ec473464b7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-080]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=3,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=2,
            filter={
              trait_contains=[[CP]],
            },
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 트래시에서 『CP』를 포함한 특징을 가진 카드 2장을 원하는 순서대로 덱 맨 아래로 되돌릴 수 있다: 상대의 코스트 3 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-080]],
    schema_version=1,
  })
end
