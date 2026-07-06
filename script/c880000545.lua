-- AUTO-GENERATED: OP04-053 / 페이지 원
-- rules_id=OP04-053 script_id=880000545 fingerprint=5cdf676f6b894ee5fe027e2b82c1441de113d8b112b6bac55a99f47bcc8868d1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-053]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[RETURN_HAND_TO_DECK]],
            player=[[YOU]],
            positions={
              [[DECK_BOTTOM]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【두웅!!×1】【턴 1회】자신이 이벤트를 발동했을 때, 카드를 1장 뽑는다. 그 후, 자신의 패 1장을 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_YOUR_EVENT_ACTIVATED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-053]],
    schema_version=1,
  })
end
