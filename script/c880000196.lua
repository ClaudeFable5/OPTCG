-- AUTO-GENERATED: OP01-073 / 돈키호테 도플라밍고
-- rules_id=OP01-073 script_id=880000196 fingerprint=a271857211908cd66fb40d51ce183ddd250f53c2d2b0956e63b20e5e3211e852
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-073]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=5,
            destinations={
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
            op=[[LOOK_REORDER_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 5장을 보고 원하는 순서대로 덱 맨 위나 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP01-073]],
    schema_version=1,
  })
end
