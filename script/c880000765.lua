-- AUTO-GENERATED: OP06-031 / 핫짱
-- rules_id=OP06-031 script_id=880000765 fingerprint=f47ab9200e56428f4a951e21cbaba74ec9a7ee086450c2546d993f3c7fa1ddc1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-031]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=3,
              trait_any={
                [[어인족]],
                [[인어족]],
              },
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 패에서 코스트 3 이하인 《어인족》 또는 《인어족》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-031]],
    schema_version=1,
  })
end
