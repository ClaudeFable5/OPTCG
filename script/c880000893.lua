-- AUTO-GENERATED: OP07-038 / 보아 행콕
-- rules_id=OP07-038 script_id=880000893 fingerprint=13d5c69c32ca87bb11da853ab4324dcc9b64f44058fe5ae12381fb2ed6d6a2e2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-038]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
          {
            count=5,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【자신의 턴 동안】【턴 1회】캐릭터가 자신의 효과로 필드를 벗어났을 때, 발동할 수 있다. 자신의 패가 5장 이하인 경우, 카드를 1장 뽑는다.]],
        timings={
          [[ON_OWN_CHARACTER_LEFT_BY_EFFECT]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-038]],
    schema_version=1,
  })
end
