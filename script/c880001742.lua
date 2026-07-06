-- AUTO-GENERATED: ST02-013 / 유스타스 키드
-- rules_id=ST02-013 script_id=880001742 fingerprint=a36fdc6b214e449723e80fcc38e69b29f74c39ce289ff8fe44e755c0179b9be8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST02-013]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【두웅!!x1】【자신의 턴 종료 시】이 캐릭터를 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST02-013]],
    schema_version=1,
  })
end
