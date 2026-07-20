-- AUTO-GENERATED: EB03-023 / 카야
-- rules_id=EB03-023 script_id=880002126 fingerprint=1fb6ea73028ccb9871cde6e1c300b532e968c392cb06edc0075ccdf66d77720b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-023]],
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
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 5장을 보고, 원하는 순서대로 덱 맨 위나 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-023]],
    schema_version=1,
  })
end
