-- AUTO-GENERATED: OP01-116 / 인조 악마의 열매 SMILE
-- rules_id=OP01-116 script_id=880000239 fingerprint=118fdccae58ed3dafe1b89bcc24163f4aa0a1f69fa943251f997b5e067dcfb3d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-116]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            filter={
              card_type=[[CHARACTER]],
              cost_lte=3,
              trait=[[SMILE]],
            },
            look_count=5,
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
        source_text=[[【메인】 자신의 덱 위에서 5장을 보고, 코스트 3 이하인 《SMILE》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
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
    rules_id=[[OP01-116]],
    schema_version=1,
  })
end
