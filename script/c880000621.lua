-- AUTO-GENERATED: OP05-009 / 토토
-- rules_id=OP05-009 script_id=880000621 fingerprint=ad8b7ad5c85bc806311b4998c1f2fa61e4bde58220cb9ecd39b20d64d17b531e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-009]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            amount=0,
            op=[[LEADER_POWER_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더의 파워가 0 이하인 경우, 카드를 1장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-009]],
    schema_version=1,
  })
end
