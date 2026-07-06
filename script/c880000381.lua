-- AUTO-GENERATED: OP03-015 / 리무
-- rules_id=OP03-015 script_id=880000381 fingerprint=74215b9cc4f4b087cae80605f5c358de8aed27d2e1a2feb763ca5014ea9397ee
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-015]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[OPPONENT_TURN]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】이 캐릭터가 KO 당했을 때, 이번 턴 동안, 상대의 리더 또는 캐릭터 1장까지의 파워 -2000.]],
        timings={
          [[ON_SELF_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP03-015]],
    schema_version=1,
  })
end
