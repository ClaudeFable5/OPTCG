-- AUTO-GENERATED: OP08-046 / 샤쿠야쿠
-- rules_id=OP08-046 script_id=880001022 fingerprint=a921605c4958e0e4f2eaeed915fd440442f906bccb1839bdcb41411c838bff77
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-046]],
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
          {
            op=[[REST]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
          {
            count=5,
            op=[[HAND_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【자신의 턴 동안】【턴 1회】캐릭터가 자신의 효과로 필드를 벗어났을 때, 상대의 패가 5장 이상인 경우, 상대는 자신의 패 1장을 덱 맨 아래로 되돌린다. 그 후, 이 캐릭터를 레스트한다.]],
        timings={
          [[ON_OWN_CHARACTER_LEFT_BY_EFFECT]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-046]],
    schema_version=1,
  })
end
