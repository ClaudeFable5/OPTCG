-- AUTO-GENERATED: EB02-046 / 힐돈
-- rules_id=EB02-046 script_id=880000108 fingerprint=eb4d4ead253d72d0f2932efedcf0a9230ae97b0e0619d9272487b8663a1af4ca
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-046]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[MILL_DECK]],
            player=[[YOU]],
          },
          {
            amount=-1,
            duration=[[THIS_TURN]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 2장을 트래시에 놓고, 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -1.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-046]],
    schema_version=1,
  })
end
