-- AUTO-GENERATED PROMO: P-066 / 보아 행콕
-- rules_id=P-066 script_id=880002496
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-066]],
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
                trait=[[구사 해적단]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=5,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】자신의 패가 5장 이하인 경우, 자신의 《구사 해적단》 특징을 가진 모든 캐릭터의 파워 +1000.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[P-066]],
    schema_version=1,
  })
end
