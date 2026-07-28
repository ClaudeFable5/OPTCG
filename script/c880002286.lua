-- AUTO-GENERATED: ST29-001 / 몽키 D. 루피
-- rules_id=ST29-001 script_id=880002286 fingerprint=b4edeae223a5092b8046c5b3c54ae9e0a46c95e2d97a5bb7314ea62e018c1be0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST29-001]],
    compile_status=[[AUTO]],
    effects={
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
        source_text=[[【어택 시】자신의 라이프가 2장 이하인 경우, 카드를 1장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST29-001]],
    schema_version=1,
  })
end
