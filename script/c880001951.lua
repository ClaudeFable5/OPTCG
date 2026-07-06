-- AUTO-GENERATED: ST21-011 / 프랑키
-- rules_id=ST21-011 script_id=880001951 fingerprint=284c1c8043e77f7f4f18871106774c8985da2053f4ba208e29d561c98eb4b43e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST21-011]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=0,
              filter={
                base_power_lte=4000,
                trait=[[밀짚모자 일당]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】【상대의 턴 동안】자신의 원래 파워가 4000 이하인 《밀짚모자 일당》 특징을 가진 모든 캐릭터의 파워 +1000.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST21-011]],
    schema_version=1,
  })
end
