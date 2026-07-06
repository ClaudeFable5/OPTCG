-- AUTO-GENERATED: OP07-087 / 바스카빌
-- rules_id=OP07-087 script_id=880000942 fingerprint=38f17a9bbbb7e1fb41141e852d7def971fb758f115db6ee8b7c48186d7a5dccd
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-087]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3000,
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
            filter={
              cost_eq=0,
            },
            op=[[CHARACTER_EXISTS]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】상대의 코스트 0인 캐릭터가 있을 경우, 이 캐릭터의 파워 +3000.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-087]],
    schema_version=1,
  })
end
