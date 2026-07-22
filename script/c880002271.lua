-- AUTO-GENERATED: OP14-106 / 살로메
-- rules_id=OP14-106 script_id=880002271 fingerprint=d9a5d44564b059a1c1134f829c9a76ca937cfe8b4ca66c48fdde57384bc11ff1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-106]],
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
    rules_id=[[OP14-106]],
    schema_version=1,
  })
end
