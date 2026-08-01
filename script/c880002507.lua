-- AUTO-GENERATED PROMO: P-085 / 쥬얼리 보니
-- rules_id=P-085 script_id=880002507
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-085]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            faceup=true,
            op=[[ADD_TO_OWNER_LIFE]],
            positions={
              [[LIFE_TOP]],
              [[LIFE_BOTTOM]],
            },
            selector={
              count=1,
              filter={
                cost_lte=4,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[초신성]],
          },
          {
            op=[[LIFE_LTE_OPPONENT]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《초신성》 특징을 가지고 있고, 자신의 라이프 수가 상대의 라이프 수 이하인 경우, 상대의 코스트 4 이하인 캐릭터를 1장까지 주인의 라이프 맨 위나 아래에 앞면으로 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[P-085]],
    schema_version=1,
  })
end
