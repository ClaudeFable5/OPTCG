-- AUTO-GENERATED: EB03-032 / 샬롯 플랑페
-- rules_id=EB03-032 script_id=880002135 fingerprint=d60e139438d15252067294099d678541ec4fb7f53361d3b196120311a123e1db
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-032]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                name=[[샬롯 카타쿠리]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】【등장 시】이번 턴 동안, 자신의 「샬롯 카타쿠리」 1장까지의 파워 +2000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-032]],
    schema_version=1,
  })
end
