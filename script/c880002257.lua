-- AUTO-GENERATED: OP14-092 / Mr.3(갤디노)
-- rules_id=OP14-092 script_id=880002257 fingerprint=7c341ce817a822c7ef29b71f3e262bb4ef84c054edbec9d2cd8be95c3df51ace
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-092]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_KO]],
            optional=true,
            reason=[[ANY]],
            replacement_costs={
              {
                count=3,
                op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
              },
            },
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
        once_per_turn=true,
        source_text=[[【상대의 턴 동안】【턴 1회】이 캐릭터가 KO 될 경우, 대신 자신의 트래시에서 카드 3장을 원하는 순서대로 덱 맨 아래에 놓을 수 있다.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-092]],
    schema_version=1,
  })
end
