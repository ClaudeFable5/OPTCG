-- AUTO-GENERATED: OP05-046 / 달마시안
-- rules_id=OP05-046 script_id=880000658 fingerprint=189ca98584940cf543d9451a1cf77da8d4bd0868219b672dc5209f044f5dbb20
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-046]],
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
            order=[[CHOOSE]],
            player=[[YOU]],
            positions={
              [[DECK_BOTTOM]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】카드를 1장 뽑고, 자신의 패 1장을 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-046]],
    schema_version=1,
  })
end
