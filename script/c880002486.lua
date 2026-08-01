-- AUTO-GENERATED PROMO: P-034 / 상디
-- rules_id=P-034 script_id=880002486
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-034]],
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
    rules_id=[[P-034]],
    schema_version=1,
  })
end
