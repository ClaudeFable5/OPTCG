-- AUTO-GENERATED: OP06-044 / 기온
-- rules_id=OP06-044 script_id=880000778 fingerprint=1baee421db17100ce972fb8540697fba8cffd731eaa404400cff5aa1727f5444
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-044]],
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
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【자신의 턴 동안】【턴 1회】상대가 이벤트를 발동했을 때, 상대는 자신의 패 1장을 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_OPPONENT_EVENT_ACTIVATED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-044]],
    schema_version=1,
  })
end
