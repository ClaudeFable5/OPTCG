-- AUTO-GENERATED: OP04-098 / 오토코
-- rules_id=OP04-098 script_id=880000590 fingerprint=b342b623c3a95ed867c861c95eb99a7f1ce15fdface33c130c4951bf7003d51a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-098]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[EXACT]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            count=1,
            op=[[LIFE_LTE]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=2,
            filter={
              trait=[[와노쿠니]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 《와노쿠니》 특징을 가진 카드 2장을 버릴 수 있다: 자신의 라이프가 1장 이하인 경우, 자신의 덱 위에서 1장을 라이프 맨 위에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-098]],
    schema_version=1,
  })
end
