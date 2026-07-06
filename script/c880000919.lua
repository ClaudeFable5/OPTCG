-- AUTO-GENERATED: OP07-064 / 상디
-- rules_id=OP07-064 script_id=880000919 fingerprint=7effb4b0c85c74002cdf015c663872ea9b2ace1df7178607a2786c0ac1db074d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-064]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-3,
            conditions={
              {
                count=2,
                op=[[FIELD_DON_BEHIND_BY_GTE]],
                player=[[YOU]],
              },
            },
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_HAND_COST]],
            player=[[YOU]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[패의 이 카드는 자신 필드의 두웅!! 수가 상대 필드의 두웅!! 수보다 2장 이상 적을 경우, 코스트 -3.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP07-064]],
    schema_version=1,
  })
end
