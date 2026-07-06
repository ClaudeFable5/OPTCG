-- AUTO-GENERATED: OP10-008 / 스카치
-- rules_id=OP10-008 script_id=880001223 fingerprint=7970c0a19b2bd0479cde0fa2f0304ae46c018c1a1cda6aee36483ac62cba73af
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-008]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              name=[[록]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            name=[[록]],
            op=[[CHARACTER_NAME_ABSENT]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 「록」이 없을 경우, 자신의 패에서 「록」을 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP10-008]],
    schema_version=1,
  })
end
