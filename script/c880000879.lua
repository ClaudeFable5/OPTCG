-- AUTO-GENERATED: OP07-025 / 코리브
-- rules_id=OP07-025 script_id=880000879 fingerprint=e3278813038d0d3b2c3c1a7f83dcb4b177c34915cea93cffc5b6cbeb660dcb4d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-025]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              cost_lte=4,
              name=[[카리브]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 코스트 4 이하인 「카리브」를 1장까지 레스트 상태로 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-025]],
    schema_version=1,
  })
end
