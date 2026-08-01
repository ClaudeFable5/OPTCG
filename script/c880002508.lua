-- AUTO-GENERATED PROMO: P-088 / 트라팔가 로
-- rules_id=P-088 script_id=880002508
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-088]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[초신성]],
          },
          {
            count=5,
            op=[[LIFE_TOTAL_LTE]],
            players=[[BOTH]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】 자신의 리더가 《초신성》 특징을 가지고 있고, 서로의 라이프 합계가 5장 이하인 경우, 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[P-088]],
    schema_version=1,
  })
end
