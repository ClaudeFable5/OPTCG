-- AUTO-GENERATED: ST09-001 / 야마토
-- rules_id=ST09-001 script_id=880001849 fingerprint=6ecad371bdd112a154c3aa829aeb4fa4e90b48ece510307d93cc56490d2a5178
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST09-001]],
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
            count=2,
            op=[[LIFE_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【상대의 턴 동안】자신의 라이프가 2장 이하인 경우, 이 리더의 파워 +1000.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST09-001]],
    schema_version=1,
  })
end
