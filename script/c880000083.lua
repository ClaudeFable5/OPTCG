-- AUTO-GENERATED: EB02-022 / 우솝
-- rules_id=EB02-022 script_id=880000083 fingerprint=723e7fb16e5dd31bcc4fd7deb1ff3bc4369ecc367c32808d6b15e8e96535971e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-022]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              power_lte=6000,
              vanilla=true,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            count=2,
            filter={
              power_gte=5000,
            },
            op=[[CHARACTER_COUNT_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 파워 5000 이상인 캐릭터가 2장 이하인 경우, 자신의 패에서 파워 6000 이하이고 원래 효과가 없는 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-022]],
    schema_version=1,
  })
end
