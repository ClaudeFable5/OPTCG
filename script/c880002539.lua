-- AUTO-GENERATED PROMO: P-081 / 쥬라큘 미호크
-- rules_id=P-081 script_id=880002539
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-081]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_gte=5,
              cost_lte=5,
              trait=[[크로스 길드]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            count=3,
            filter={
              color=[[BLUE]],
              trait=[[크로스 길드]],
            },
            op=[[CHARACTER_COUNT_GTE]],
            player=[[YOU]],
          },
        },
        costs={
          {
            op=[[RETURN_SELF_TO_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 주인의 패로 되돌릴 수 있다: 자신의 청색인 《크로스 길드》 특징을 가진 캐릭터가 3장 이상인 경우, 자신의 패에서 코스트 5인 《크로스 길드》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[P-081]],
    schema_version=1,
  })
end
