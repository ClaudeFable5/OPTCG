-- AUTO-GENERATED: P-014 / 코비
-- rules_id=P-014 script_id=880002018 fingerprint=1793bc92c8065cb1f5f061abd3a562a23476df342f42c04ce29576d0fc8cb1d5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-014]],
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
    rules_id=[[P-014]],
    schema_version=1,
  })
end
