-- AUTO-GENERATED: OP12-021 / 잇폰마츠
-- rules_id=OP12-021 script_id=880001474 fingerprint=5ac5b25fa727f027f9ec413b7d3cf8561b2804cade46a466afa910be762a1404
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-021]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_BE_RESTED]],
            reason=[[OPPONENT_EFFECT]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            attribute=[[SLASH]],
            op=[[LEADER_HAS_ATTRIBUTE]],
            player=[[YOU]],
          },
          {
            count=6,
            op=[[RESTED_DON_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 <참격> 속성을 가지고, 자신의 레스트 상태인 두웅!!이 6장 이상인 경우, 이 캐릭터는 상대의 효과로는 레스트되지 않는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP12-021]],
    schema_version=1,
  })
end
