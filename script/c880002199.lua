-- AUTO-GENERATED: OP14-034 / 몽키 D. 루피
-- rules_id=OP14-034 script_id=880002199 fingerprint=09210c9456c29c8eb08a47aa1da72a9d2b710de8ee537538870c8eaaabddd23c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-034]],
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
                base_cost_gte=4,
                color=[[GREEN]],
                trait=[[밀짚모자 일당]],
              },
              kind=[[CHARACTER]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】자신의 원래 코스트가 4 이상인 녹색 《밀짚모자 일당》 특징을 가진 모든 캐릭터의 파워 +1000.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_KO]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_costs={
              {
                count=1,
                kinds={
                  [[CHARACTER]],
                },
                op=[[REST_OWN_CARD]],
              },
            },
            selector={
              count=1,
              filter={
                trait=[[밀짚모자 일당]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【턴 1회】자신의 《밀짚모자 일당》 특징을 가진 캐릭터가 상대의 효과로 KO 될 경우, 대신 자신의 캐릭터 1장을 레스트로 할 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-034]],
    schema_version=1,
  })
end
