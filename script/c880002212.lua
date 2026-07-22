-- AUTO-GENERATED: OP14-047 / 시라호시
-- rules_id=OP14-047 script_id=880002212 fingerprint=f39dbef109a5db8ec1e863e873641c9e914f711fb1802cf6b4a84f20f7cb593c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-047]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
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
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】카드를 1장 뽑고, 자신의 패에서 코스트 3 이하인 《어인족》이나 《인어족》 특징을 가진 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP14-047]],
    schema_version=1,
  })
end
