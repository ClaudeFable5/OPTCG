-- AUTO-GENERATED: EB01-021 / 한냐발
-- rules_id=EB01-021 script_id=880000020 fingerprint=3bc60a6df614d4ed1627160533daf1272b1a450011c4d96b46054fa3e65ec1e1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-021]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[ACTIVE]],
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
                trait=[[임펠 다운]],
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 코스트 2 이상인 《임펠 다운》 특징을 가진 캐릭터 1장을 주인의 패로 되돌릴 수 있다: 두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-021]],
    schema_version=1,
  })
end
