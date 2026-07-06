-- AUTO-GENERATED: OP06-009 / 슬라이어
-- rules_id=OP06-009 script_id=880000743 fingerprint=368e93e85139646d7a257b06937e9bccb696c0022fa42b5e96cc53f0df6cd5c5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-009]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_YOUR_NEXT_TURN_START]],
            op=[[SET_BASE_POWER_FROM_TARGET]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            source_selector={
              count=1,
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【어택 시】/【블록 시】【턴 1회】다음 자신의 턴 개시 시까지, 이 캐릭터의 원래 파워는 상대의 리더와 동일한 파워가 된다.]],
        timings={
          [[WHEN_ATTACKING]],
          [[ON_BLOCK]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP06-009]],
    schema_version=1,
  })
end
