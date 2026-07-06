-- AUTO-GENERATED: OP03-014 / 몽키 D. 가프
-- rules_id=OP03-014 script_id=880000380 fingerprint=66d5e563b4f1eee47b212f9f2a6f8a0c53c00d5b8698ea06ada5efd5c0f34cec
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-014]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              color=[[RED]],
              cost_eq=1,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 패에서 코스트 1인 적색 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-014]],
    schema_version=1,
  })
end
