-- AUTO-GENERATED: EB02-044 / 센고쿠
-- rules_id=EB02-044 script_id=880000106 fingerprint=d9d6a60bfab97bec3d1e67f62a1c8a9e2083ece2350b8bfa8ee04afdad805a77
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-044]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              color=[[BLACK]],
              cost_lte=4,
              trait=[[해군]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 트래시에서 코스트 4 이하이고 흑색인 《해군》 특징을 가진 캐릭터 카드를 1장까지 레스트 상태로 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB02-044]],
    schema_version=1,
  })
end
