-- AUTO-GENERATED: OP05-022 / 돈키호테 로시난테
-- rules_id=OP05-022 script_id=880000634 fingerprint=fbe4d5266431ff9523e85ce4b1d4685e87a02074884a80d27aef98c440746fd5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-022]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
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
            count=6,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 패가 6장 이하인 경우, 이 리더를 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP05-022]],
    schema_version=1,
  })
end
