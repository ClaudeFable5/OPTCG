-- AUTO-GENERATED: OP05-030 / 돈키호테 로시난테
-- rules_id=OP05-030 script_id=880000642 fingerprint=6a569ce4398085241da8a907c8b2289916e421c5c3146478701d7ef2a5313430
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-030]],
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
                op=[[TRASH_SELF]],
              },
            },
            selector={
              count=0,
              filter={
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】자신의 레스트 상태인 캐릭터가 KO 당했을 경우, 대신 이 캐릭터를 트래시에 놓을 수 있다.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP05-030]],
    schema_version=1,
  })
end
