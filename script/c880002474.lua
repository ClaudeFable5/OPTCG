-- AUTO-GENERATED: EB04-053 / 센토마루
-- rules_id=EB04-053 script_id=880002474 fingerprint=265aa9e17a3462e6d9369c213882ba32e8f5b8e79cc4ce6de2c35287959e88cf
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-053]],
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
            count=2,
            op=[[LIFE_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【블록 시】자신의 라이프가 2장 이하인 경우, 카드를 1장 뽑는다.]],
        timings={
          [[ON_BLOCK]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB04-053]],
    schema_version=1,
  })
end
