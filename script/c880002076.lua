-- AUTO-GENERATED: ST15-003 / 킹듀
-- rules_id=ST15-003 script_id=880002076 fingerprint=6a4d2159743a36cb03558352a85638b30bd8934778093e8a675c6a422ffe83f6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST15-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
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
        source_text=[[【상대의 턴 동안】이 캐릭터가 효과로 KO 당했을 때, 이번 턴 동안, 자신의 리더 1장까지의 파워 +2000.]],
        timings={
          [[ON_KO_BY_OPPONENT_EFFECT]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST15-003]],
    schema_version=1,
  })
end
