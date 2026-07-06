-- AUTO-GENERATED: ST24-001 / 카포네 벳지
-- rules_id=ST24-001 script_id=880001980 fingerprint=8f979f1a490db8738a51d698aa3853542a0be53b24e3f9e1b0364929fc73d65d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST24-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            actions={
              {
                count=1,
                op=[[DRAW]],
                player=[[YOU]],
              },
              {
                count=1,
                op=[[TRASH_HAND]],
                player=[[YOU]],
                ["then"]=true,
              },
            },
            conditions={
              {
                count=6,
                op=[[RESTED_CARD_COUNT_GTE]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 레스트 상태인 카드가 6장 이상인 경우, 카드를 1장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST24-001]],
    schema_version=1,
  })
end
