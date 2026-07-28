-- AUTO-GENERATED: OP15-059 / 아마존
-- rules_id=OP15-059 script_id=880002361 fingerprint=532f6f74c3a41cb1fb181ed880d5ab7278d3942df83aa7d29766f3b16b601b13
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-059]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[OPPONENT_MAY_RETURN_ACTIVE_DON_OR]],
            otherwise={
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
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 어택 시】이 캐릭터를 레스트로 할 수 있다: 상대는 자신의 액티브 상태인 두웅!! 1장을 두웅!! 덱에 되돌려도 된다. 되돌리지 않은 경우, 상대의 리더나 캐릭터 1장까지는 이번 턴 동안 파워 -2000.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-059]],
    schema_version=1,
  })
end
