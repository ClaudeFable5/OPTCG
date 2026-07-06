-- AUTO-GENERATED: OP05-098 / 에넬
-- rules_id=OP05-098 script_id=880000711 fingerprint=437978c448a8f6a6b3c2cb4d2108051f567464aad45e1351d031ad07dcca2b95
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-098]],
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
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={
          {
            count=0,
            op=[[LIFE_EQ]],
            player=[[YOU]],
          },
          {
            op=[[OPPONENT_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【상대의 턴 동안】【턴 1회】자신의 라이프가 0장이 되었을 때, 자신의 덱 위에서 1장을 라이프 맨 위에 더한다. 그 후, 자신의 패 1장을 버린다.]],
        timings={
          [[ON_YOUR_LIFE_DECREASED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-098]],
    schema_version=1,
  })
end
