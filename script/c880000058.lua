-- AUTO-GENERATED: EB01-058 / 몽블랑 크리켓
-- rules_id=EB01-058 script_id=880000058 fingerprint=e7685d1adedeecc98fabe20634209af3b47b08370d5159d222cc6a86733075ee
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-058]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
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
        source_text=[[【두웅!!×1】【자신의 턴 동안】자신의 라이프가 2장 이하인 경우, 이 캐릭터의 파워 +2000.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-058]],
    schema_version=1,
  })
end
