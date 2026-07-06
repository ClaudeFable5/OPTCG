-- AUTO-GENERATED: OP04-113 / 라비앙
-- rules_id=OP04-113 script_id=880000605 fingerprint=e78da9aeed653c9c4bae7497f71631fd5c6a440b50591615b280c2ee5708f57d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-113]],
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
    keywords={},
    rules_id=[[OP04-113]],
    schema_version=1,
  })
end
