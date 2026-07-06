-- AUTO-GENERATED: ST06-008 / 히나
-- rules_id=ST06-008 script_id=880001807 fingerprint=204f79f64df04e3d382062cce3f1bab88819eb7d0fab7d165d66889dfc3bc84f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST06-008]],
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
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -4.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST06-008]],
    schema_version=1,
  })
end
