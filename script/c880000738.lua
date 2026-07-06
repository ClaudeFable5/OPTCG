-- AUTO-GENERATED: OP06-004 / 오마츠리 남작
-- rules_id=OP06-004 script_id=880000738 fingerprint=f1dd3eb3eed5ea000cb5ec129ea5b1a02d188acb4fe317846f611ce5cb93cd7b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-004]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              name=[[릴리 카네이션]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 「릴리 카네이션」을 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-004]],
    schema_version=1,
  })
end
