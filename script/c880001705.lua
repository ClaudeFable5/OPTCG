-- AUTO-GENERATED: PRB02-014 / 사보
-- rules_id=PRB02-014 script_id=880001705 fingerprint=e46b3eb1e7ef258a1663690d1b6132dd4e7f249d85fc6b08f970fbfee25754fd
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[PRB02-014]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-3,
            conditions={
              {
                count=15,
                op=[[TRASH_GTE]],
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
        source_text=[[패의 이 카드는 자신의 트래시가 15장 이상 있을 경우, 코스트 -3.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[PRB02-014]],
    schema_version=1,
  })
end
