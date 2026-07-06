-- AUTO-GENERATED: EB01-014 / 상디
-- rules_id=EB01-014 script_id=880000013 fingerprint=85ef735f120a2c8cb516002f9ad6526551b9609748c0abad1666462e63f129ce
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-014]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount_per=1000,
            divisor=3,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER_PER_COUNT]],
            player=[[YOU]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            source=[[RESTED_DON]],
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【자신의 턴 동안】자신의 레스트 상태인 두웅!! 3장당, 이 캐릭터의 파워 +1000.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-014]],
    schema_version=1,
  })
end
