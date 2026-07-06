-- AUTO-GENERATED: PRB02-009 / Mr.3(갤디노)
-- rules_id=PRB02-009 script_id=880001700 fingerprint=66e0c5377474188e24c1a8a4f4d05bced84f92df7f8dadb517769d72a87fb361
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[PRB02-009]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[TRASH]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 캐릭터가 상대의 효과로 레스트되었을 때, 발동할 수 있다. 이 캐릭터를 트래시에 놓고, 카드를 2장 뽑는다.]],
        timings={
          [[ON_SELF_RESTED_BY_OPPONENT_EFFECT]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[PRB02-009]],
    schema_version=1,
  })
end
