-- AUTO-GENERATED: OP01-059 / 띠리잉‼
-- rules_id=OP01-059 script_id=880000182 fingerprint=951b51f2b2d3b7e845a57296165b5921e2d36a7033ee4e68254b428766c64154
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-059]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                cost_lte=3,
                trait=[[와노쿠니]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              trait=[[와노쿠니]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】 자신의 패에서 《와노쿠니》 특징을 가진 카드 1장을 버릴 수 있다: 자신의 코스트 3 이하인 《와노쿠니》 특징을 가진 캐릭터를 1장까지 액티브로 한다.]],
        timings={
          [[MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-059]],
    schema_version=1,
  })
end
