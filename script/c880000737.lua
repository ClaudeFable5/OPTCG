-- AUTO-GENERATED: OP06-003 / 엠포리오 이반코프
-- rules_id=OP06-003 script_id=880000737 fingerprint=93dde84d403984ea28b3c1b39bdd1eff1a1d226e4ce5df82f65f94a1bef6a169
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            filter={
              card_type=[[CHARACTER]],
              power_lte=5000,
              trait=[[혁명군]],
            },
            look_count=3,
            op=[[PLAY_FROM_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            rested=false,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 3장을 보고, 파워 5000 이하인 《혁명군》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-003]],
    schema_version=1,
  })
end
