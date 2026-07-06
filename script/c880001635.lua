-- AUTO-GENERATED: OP13-063 / 코즈키 오뎅
-- rules_id=OP13-063 script_id=880001635 fingerprint=75311c780bbf14f0e36ad0ebe27219ba95250fd086d5b08e1a7ca9ee826cea3c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-063]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
        },
        conditions={
          {
            count=1,
            op=[[ATTACHED_DON_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 부여되어 두웅!!이 있을 경우, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP13-063]],
    schema_version=1,
  })
end
