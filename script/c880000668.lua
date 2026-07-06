-- AUTO-GENERATED: OP05-056 / X 배럴즈
-- rules_id=OP05-056 script_id=880000668 fingerprint=3461290711ec8060dcd0f802ed1a523473cfbbf2aa0efef0c75efc0ead876668
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-056]],
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
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_OWN_CARD_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
            selector={
              count=1,
              filter={
                card_type=[[CHARACTER]],
                exclude_self=true,
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】이 캐릭터 이외의 자신의 캐릭터 1장을 덱 맨 아래로 되돌릴 수 있다: 카드를 1장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-056]],
    schema_version=1,
  })
end
