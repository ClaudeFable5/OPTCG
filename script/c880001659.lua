-- AUTO-GENERATED: OP13-087 / 차를로스 성
-- rules_id=OP13-087 script_id=880001659 fingerprint=a74f585a3f30a8778761506fa5b5c8ccb3827a9e8f748fb3462a74bac68a9a39
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-087]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[MILL_DECK]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 1장을 트래시에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP13-087]],
    schema_version=1,
  })
end
