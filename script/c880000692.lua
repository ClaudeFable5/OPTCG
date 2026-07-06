-- AUTO-GENERATED: OP05-079 / 비올라
-- rules_id=OP05-079 script_id=880000692 fingerprint=f90af5694e2a1bdd86192b3fab78a83a9abcd1f542e1fe5b206bd5f13d877cf3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-079]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=3,
            filter={},
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대는 자신의 트래시에서 카드 3장을 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-079]],
    schema_version=1,
  })
end
