-- AUTO-GENERATED: OP07-093 / 로브 루치
-- rules_id=OP07-093 script_id=880000948 fingerprint=54a1a215d0e1ec070a96ff1443329018f7e188d51d6a5ec1f7590b8ae7f533b3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-093]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[OPPONENT]],
          },
          {
            count=1,
            filter={},
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
            player=[[OPPONENT]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            count=3,
            filter={},
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 트래시에서 카드 3장을 원하는 순서대로 덱 맨 아래로 되돌릴 수 있다: 상대는 자신의 패 1장을 버린다. 그 후, 상대의 트래시에서 카드를 1장까지 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-093]],
    schema_version=1,
  })
end
