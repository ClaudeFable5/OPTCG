-- AUTO-GENERATED: OP09-046 / 크로커다일
-- rules_id=OP09-046 script_id=880001142 fingerprint=822ab4363c957411e1643bed2e7311668d3415fb65dafc5b57d5234e5dd21c5d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-046]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              any={
                {
                  trait=[[크로스 길드]],
                },
                {
                  trait_contains=[[바로크 워크스]],
                },
              },
              card_type=[[CHARACTER]],
              cost_lte=5,
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
        source_text=[[【등장 시】자신의 패에서 코스트 5 이하인 《크로스 길드》 특징 또는 『바로크 워크스』를 포함한 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-046]],
    schema_version=1,
  })
end
