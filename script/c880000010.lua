-- AUTO-GENERATED: EB01-011 / 미니 메리 2호
-- rules_id=EB01-011 script_id=880000010 fingerprint=fb6760146a335a609981473a35a2c57f046ec5c0c1c7e4503dc581e12fb0227e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-011]],
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
            op=[[REST_SELF]],
          },
          {
            count=1,
            op=[[RETURN_OWN_CARD_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
            selector={
              count=1,
              filter={
                base_power_eq=1000,
                card_type=[[CHARACTER]],
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 카드를 레스트로 하고, 자신의 원래 파워가 1000인 캐릭터 1장을 덱 맨 아래로 되돌릴 수 있다: 카드를 1장 뽑는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-011]],
    schema_version=1,
  })
end
