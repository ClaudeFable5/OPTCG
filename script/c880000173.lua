-- AUTO-GENERATED: OP01-050 / 펭귄
-- rules_id=OP01-050 script_id=880000173 fingerprint=a4766468d95324c834e70d5893d5b95d4ff7afac96cbf7ee8326b41d1cc7dfa1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-050]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              name=[[샤치]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            name=[[샤치]],
            op=[[CHARACTER_NAME_ABSENT]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 「샤치」가 없을 경우, 자신의 패에서 「샤치」를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP01-050]],
    schema_version=1,
  })
end
