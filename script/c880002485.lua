-- AUTO-GENERATED PROMO: P-033 / 몽키 D. 루피
-- rules_id=P-033 script_id=880002485
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-033]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            op=[[RETURN_SELF_TO_DECK_BOTTOM]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 주인의 덱 맨 아래로 되돌릴 수 있다: 카드를 1장 뽑는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[P-033]],
    schema_version=1,
  })
end
