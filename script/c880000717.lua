-- AUTO-GENERATED: OP05-104 / 코니스
-- rules_id=OP05-104 script_id=880000717 fingerprint=0cead88989156871bfc6c3a727ab1751e5b98d70d2776633ddfd3159b47044a1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-104]],
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
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_OWN_CARD_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
            selector={
              count=1,
              filter={
                card_type=[[STAGE]],
              },
              kind=[[STAGE]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 스테이지 1장을 덱 맨 아래로 되돌릴 수 있다: 카드를 1장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-104]],
    schema_version=1,
  })
end
