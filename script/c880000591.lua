-- AUTO-GENERATED: OP04-099 / 오링
-- rules_id=OP04-099 script_id=880000591 fingerprint=871852e0ab701a8ebe26d2f855abd3e5f5261ccc0def1b3865b8ec0291a27b3a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-099]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[RULE]],
            name=[[샬롯 링링]],
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
        source_text=[[룰상, 이 카드의 카드명은 「샬롯 링링」으로도 취급한다.]],
        timings={
          [[RULE]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={
          {
            count=1,
            op=[[LIFE_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 라이프가 1장 이하인 경우, 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-099]],
    schema_version=1,
  })
end
