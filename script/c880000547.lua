-- AUTO-GENERATED: OP04-055 / 익사이트 탄
-- rules_id=OP04-055 script_id=880000547 fingerprint=0a60cff489d8fa96c00c18d9d87e3f256ea60d14de21498ccc387ac282400ca9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-055]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              name=[[빙귀]],
            },
            mode=[[EXACT]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              name=[[빙귀]],
            },
            op=[[TRASH_HAND]],
          },
          {
            count=1,
            op=[[RETURN_OWN_CARD_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
            selector={
              count=1,
              filter={
                card_type=[[CHARACTER]],
                cost_lte=4,
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[ANY]],
              -- [수기 교정 2026-07-18] 원문 무소유지정("주인의 덱") - YOU→ANY (OP06-043 제보 패밀리)
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 패에서 「빙귀」 1장을 버리고, 코스트 4 이하인 캐릭터 1장을 주인의 덱 맨 아래로 되돌릴 수 있다: 자신의 트래시에서 「빙귀」 1장을 등장시킨다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            effect_timing=[[MAIN]],
            op=[[ACTIVATE_CARD_EFFECT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드의 【메인】 효과를 발동한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-055]],
    schema_version=1,
  })
end
