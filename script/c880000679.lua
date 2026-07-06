-- AUTO-GENERATED: OP05-066 / 징베
-- rules_id=OP05-066@08e1d74c50be script_id=880000679 fingerprint=08e1d74c50be29cdb9d8d3d42524f167e6d003ad65e483267bcfd3869287382b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-066]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
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
            count=10,
            op=[[FIELD_DON_EQ]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】자신 필드의 두웅!!이 10장인 경우, 이 캐릭터의 파워 +1000.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP05-066@08e1d74c50be]],
    schema_version=1,
  })
end
