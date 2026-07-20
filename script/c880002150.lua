-- AUTO-GENERATED: EB03-047 / 미스 발렌타인(미키타)
-- rules_id=EB03-047 script_id=880002150 fingerprint=69dfb2a91da972c2eda1e919965a775a5626e5f250707ebb05c602c09a10f038
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-047]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=3,
            op=[[MILL_DECK]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 3장을 트래시에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】카드를 1장 뽑는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-047]],
    schema_version=1,
  })
end
