-- AUTO-GENERATED: OP15-112 / 라키
-- rules_id=OP15-112 script_id=880002414 fingerprint=67da5944a6afe09d71119fa7cd2980d6107a100f643eef068b217a82af2e6251
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-112]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=3,
              trait=[[샨도라의 전사]],
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
        source_text=[[【등장 시】자신의 패에서 코스트 3 이하인 《샨도라의 전사》 특징을 가진 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP15-112]],
    schema_version=1,
  })
end
