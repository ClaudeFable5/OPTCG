-- AUTO-GENERATED: EB03-059 / S-스네이크
-- rules_id=EB03-059 script_id=880002162 fingerprint=2f5ecdaa8138867ad6276bb02118540b046c032bcec420e59e0c3927246188a5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-059]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            faceup=true,
            filter={
              card_type=[[CHARACTER]],
              has_trigger=true,
            },
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_HAND]],
            player=[[YOU]],
            position=[[LIFE_TOP]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[에그 헤드]],
          },
          {
            count=2,
            op=[[LIFE_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《에그 헤드》 특징을 가지고, 자신의 라이프가 2장 이상인 경우, 자신의 패에서 【트리거】를 가진 캐릭터 카드를 1장까지 라이프 맨 위에 앞면으로 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-059]],
    schema_version=1,
  })
end
