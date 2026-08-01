-- AUTO-GENERATED PROMO: P-027 / 프랑키 장군
-- rules_id=P-027 script_id=880002484
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-027]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[RULE]],
            name=[[프랑키]],
            op=[[ADD_NAME_ALIAS]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[룰상, 이 카드의 카드명은 「프랑키」로도 취급한다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            amount=1000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=0,
              filter={
                base_power_lte=3000,
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
        source_text=[[【상대의 턴 동안】자신의 원래 파워가 3000 이하인 모든 캐릭터의 파워 +1000.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[P-027]],
    schema_version=1,
  })
end
