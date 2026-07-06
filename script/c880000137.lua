-- AUTO-GENERATED: OP01-014 / 징베
-- rules_id=OP01-014 script_id=880000137 fingerprint=b1116755677eee796fc77d6cb07b194e76da2d78821233efd9fe2e9ba94fec5e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-014]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              color=[[RED]],
              cost_lte=2,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】 【블록 시】 자신의 패에서 코스트 2 이하인 적색 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_BLOCK]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP01-014]],
    schema_version=1,
  })
end
