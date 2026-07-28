-- AUTO-GENERATED: EB04-005 / 트라팔가 로
-- rules_id=EB04-005 script_id=880002426 fingerprint=ab95cfa0523a42dbc87eccfd808255c78e72ed3897cdd0f54c04a241f71ccaac
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-005]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_ATTACK]],
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
            filter={
              base_power_gte=5000,
            },
            op=[[CHARACTER_COUNT_LT]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[상대의 원래 파워 5000 이상인 캐릭터가 2장 이상 있지 않은 경우, 이 캐릭터는 어택할 수 없다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-005]],
    schema_version=1,
  })
end
