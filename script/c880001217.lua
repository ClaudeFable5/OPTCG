-- AUTO-GENERATED: OP10-002 / 시저 클라운
-- rules_id=OP10-002 script_id=880001217 fingerprint=0e7bc05f3b1e58d9ab650c83dc4210fc0fe6aef57373b0e2c566d1dcf389c09f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                power_lte=4000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_OWN_CARD_TO_HAND]],
            selector={
              count=1,
              filter={
                card_type=[[CHARACTER]],
                cost_gte=2,
                trait=[[펑크 하자드]],
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】【어택 시】자신의 코스트 2 이상인 《펑크 하자드》 특징을 가진 캐릭터 1장을 주인의 패로 되돌릴 수 있다: 상대의 파워 4000 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-002]],
    schema_version=1,
  })
end
