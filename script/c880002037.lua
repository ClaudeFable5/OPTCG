-- AUTO-GENERATED: P-039 / 베라미
-- rules_id=P-039 script_id=880002037 fingerprint=4ffe741212b0f58b3acf118626f9f454299fab105bec2c28cbfb177f1b0093f4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-039]],
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
            count=0,
            op=[[LIFE_EQ]],
            player=[[YOU]],
          },
        },
        costs={},
        don_attached=2,
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】자신의 라이프가 0장인 경우, 이 캐릭터의 파워 +2000.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={
      [[BANISH]],
    },
    rules_id=[[P-039]],
    schema_version=1,
  })
end
