-- AUTO-GENERATED: OP06-081 / 압살롬
-- rules_id=OP06-081 script_id=880000815 fingerprint=b3fce10560c6201e3bfa7d8080ada4ce4c1bdab5f79555ef2fa204b3d2af09f9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-081]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=2,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=2,
            filter={},
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 트래시에서 카드 2장을 원하는 순서대로 덱 맨 아래로 되돌릴 수 있다: 코스트 2 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-081]],
    schema_version=1,
  })
end
