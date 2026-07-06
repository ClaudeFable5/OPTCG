-- AUTO-GENERATED: EB01-030 / 로그 타운
-- rules_id=EB01-030 script_id=880000029 fingerprint=225423f09c392e04cf2719a859b9488cb8a67fb4247aec21ab4dbafabe258d2a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-030]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            op=[[RETURN_SELF_TO_DECK_BOTTOM]],
          },
          {
            count=1,
            filter={},
            op=[[RETURN_HAND_TO_DECK]],
            order=[[CHOOSE]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 카드와 자신의 패 1장을 원하는 순서대로 덱 맨 아래로 되돌릴 수 있다: 카드를 2장 뽑는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-030]],
    schema_version=1,
  })
end
