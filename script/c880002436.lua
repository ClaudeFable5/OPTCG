-- AUTO-GENERATED: EB04-015 / 징베
-- rules_id=EB04-015 script_id=880002436 fingerprint=f77cebd530a08ee78b3a9623b948c4f85b0a5d7f381aa6c181cac7c5192bc813
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-015]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              color=[[GREEN]],
              cost_lte=6,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT_ANY]],
            player=[[YOU]],
            traits={
              [[어인족]],
              [[인어족]],
            },
          },
        },
        costs={
          {
            count=1,
            op=[[REST_OWN_CARD]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 카드 1장을 레스트로 할 수 있다: 자신의 리더가 《어인족》이나 《인어족》 특징을 가진 경우, 자신의 패에서 코스트 6 이하인 녹색 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB04-015]],
    schema_version=1,
  })
end
