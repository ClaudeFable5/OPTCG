-- AUTO-GENERATED: OP01-004 / 우솝
-- rules_id=OP01-004 script_id=880000127 fingerprint=830af73f288416dc7bc52431a1ae6a2574827071a209f0ee73bd85178a092387
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-004]],
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
        },
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【두웅!!×1】 【자신의 턴 동안】 【턴 1회】 상대가 이벤트를 발동했을 때, 카드를 1장 뽑는다.]],
        timings={
          [[ON_OPPONENT_EVENT_ACTIVATED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-004]],
    schema_version=1,
  })
end
