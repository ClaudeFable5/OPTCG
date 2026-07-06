-- AUTO-GENERATED: OP05-047 / 바질 호킨스
-- rules_id=OP05-047 script_id=880000659 fingerprint=8c7bc7ae544036026a3b3afb1d1200895b7db1e52a23fc866bd5807c3c205f77
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-047]],
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
            amount=1000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            ["then"]=true,
          },
        },
        conditions={
          {
            count=3,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【블록 시】자신의 패가 3장 이하인 경우, 카드를 1장 뽑는다. 그 후, 이번 배틀 동안, 이 캐릭터의 파워 +1000.]],
        timings={
          [[ON_BLOCK]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP05-047]],
    schema_version=1,
  })
end
