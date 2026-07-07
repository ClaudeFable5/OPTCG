-- AUTO-GENERATED: P-006 / 몽키 D. 루피
-- rules_id=P-006 script_id=880002010 fingerprint=df891b0bad95afd2c05fa25a9b4830cc856aae6c3571b46207f95d232c135eb3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-006]],
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
        conditions={},
        costs={},
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】【자신의 턴 동안】이 캐릭터의 파워 +2000.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[P-006]],
    schema_version=1,
  })
end
