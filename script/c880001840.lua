-- AUTO-GENERATED: ST08-007 / 네펠타리 비비
-- rules_id=ST08-007 script_id=880001840 fingerprint=d86b0f917b69716451885c14b5a384a02d45faf6b48a3bdc66f108ba315a8ed7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST08-007]],
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
    rules_id=[[ST08-007]],
    schema_version=1,
  })
end
