-- AUTO-GENERATED: OP07-008 / 다나카 씨
-- rules_id=OP07-008 script_id=880000861 fingerprint=05b1a5ce018ee7200d0a09984b87d22577795a60d816eff718872777de3ff910
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-008]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP07-008]],
    schema_version=1,
  })
end
