-- AUTO-GENERATED: EB03-010 / 모네
-- rules_id=EB03-010 script_id=880002113 fingerprint=09d52564a750a3c6aecd19862df375ef9fd7709484819b27111125ebd6cd2477
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-010]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              any={
                {
                  card_type=[[CHARACTER]],
                  power_lte=1000,
                },
                {
                  card_type=[[EVENT]],
                },
              },
            },
            look_count=5,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            reveal=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 5장을 보고, 파워 1000 이하인 캐릭터 카드 또는 이벤트를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB03-010]],
    schema_version=1,
  })
end
