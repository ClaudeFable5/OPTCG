-- AUTO-GENERATED: ST08-006 / 시라호시
-- rules_id=ST08-006 script_id=880001839 fingerprint=35edbfe1b54fae889552e2e35ae6820b99e3c08bf72fa7ed94f0b0fe0788a0f7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST08-006]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-4,
            duration=[[THIS_TURN]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -4.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST08-006]],
    schema_version=1,
  })
end
