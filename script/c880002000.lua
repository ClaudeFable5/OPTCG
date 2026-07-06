-- AUTO-GENERATED: ST28-001 / 아슈라 동자
-- rules_id=ST28-001 script_id=880002000 fingerprint=dd2b5b20947840efc5e6b17abfb25991115d679ede38c2db7a7020af4d69ac55
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST28-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                base_cost_lte=5,
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
            trait=[[와노쿠니]],
          },
          {
            count=3,
            op=[[LIFE_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《와노쿠니》 특징을 가지고, 상대의 라이프가 3장 이상인 경우, 상대의 원래 코스트가 5 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST28-001]],
    schema_version=1,
  })
end
