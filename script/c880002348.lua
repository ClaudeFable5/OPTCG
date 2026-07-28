-- AUTO-GENERATED: OP15-046 / 사보
-- rules_id=OP15-046 script_id=880002348 fingerprint=8b91cdcadf12c1eeb0a9f013a6a4728ab0da8c4a065017730b58a5d2f392882c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-046]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[EVENT]],
              trait=[[드레스로자]],
            },
            mode=[[UP_TO]],
            op=[[ACTIVATE_CARD_EFFECT]],
            player=[[YOU]],
            source_zone=[[HAND]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[드레스로자]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《드레스로자》 특징을 가진 경우, 자신의 패에서 《드레스로자》 특징을 가진 이벤트 1장까지를 발동한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP15-046]],
    schema_version=1,
  })
end
