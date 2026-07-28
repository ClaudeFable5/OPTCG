-- AUTO-GENERATED: OP15-005 / 캐버디
-- rules_id=OP15-005 script_id=880002307 fingerprint=4b42eca0a2b70569dc8feb0dd2c07f7b4ed56aa758250168a2cd504549acbce5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-005]],
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
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[OPPONENT_GIVEN_DON_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】상대의 부여된 두웅!!이 있는 경우, 이 캐릭터는 이번 턴 동안 파워 +2000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-005]],
    schema_version=1,
  })
end
