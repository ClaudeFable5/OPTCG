-- AUTO-GENERATED: PRB02-011 / 돈키호테 도플라밍고
-- rules_id=PRB02-011 script_id=880001702 fingerprint=f05bf7441ac33a670a62725564dd125bbd32d872f88d3a367c744905763cecb6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[PRB02-011]],
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
            op=[[LEADER_IS_MULTICOLOR]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 다색인 경우, 두웅!! 덱에서 두웅!!을 1장까지 레스트로 추가한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[PRB02-011]],
    schema_version=1,
  })
end
