-- AUTO-GENERATED: OP07-047 / 트라팔가 로
-- rules_id=OP07-047 script_id=880000902 fingerprint=4ba34656ffc9e8a85dc9fba5d1c218c6090ebf85b97c194d7c2537fc5a64ec1f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-047]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[RETURN_HAND_TO_DECK]],
            order=[[CHOOSE]],
            player=[[OPPONENT]],
            positions={
              [[DECK_BOTTOM]],
            },
          },
        },
        conditions={
          {
            count=6,
            op=[[HAND_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={
          {
            op=[[RETURN_SELF_TO_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 주인의 패로 되돌릴 수 있다: 상대의 패가 6장 이상인 경우, 상대는 자신의 패 1장을 덱 맨 아래로 되돌린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-047]],
    schema_version=1,
  })
end
