-- AUTO-GENERATED: OP01-091 / 킹
-- rules_id=OP01-091 script_id=880000214 fingerprint=88615ebea0586d7b08f729f67b740342a616ce6271427acaba61223f11c06607
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-091]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-1000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=0,
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[OPPONENT]],
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
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】자신 필드에 두웅!!이 10장인 경우, 상대의 모든 캐릭터의 파워 -1000.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-091]],
    schema_version=1,
  })
end
