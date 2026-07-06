-- AUTO-GENERATED: OP11-083 / 카리브
-- rules_id=OP11-083 script_id=880001417 fingerprint=d1663e31099e2d630e9539e5bf88d2704d9621cf70e16b6daf0de9318245476c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-083]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패 2장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP11-083]],
    schema_version=1,
  })
end
