-- AUTO-GENERATED: ST12-013 / 제프
-- rules_id=ST12-013 script_id=880001895 fingerprint=0cf67cff7790b6856c4bfa4b8f280ea5ae0c70a2076742c73611aa8a8c1b44b9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST12-013]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=3,
            destinations={
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
            op=[[LOOK_REORDER_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 3장을 보고, 원하는 순서대로 덱 맨 위나 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            filter={
              card_type=[[CHARACTER]],
              cost_eq=2,
            },
            look_count=1,
            op=[[PLAY_FROM_DECK_TOP]],
            player=[[YOU]],
            rest_destinations={
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
            rest_order=[[CHOOSE]],
            rested=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 덱 위에서 1장을 공개하고, 코스트 2인 캐릭터 카드를 1장까지 레스트 상태로 등장시킨다. 그 후, 남은 카드를 덱 맨 위나 아래로 되돌린다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST12-013]],
    schema_version=1,
  })
end
