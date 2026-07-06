-- AUTO-GENERATED: OP03-112 / 샬롯 푸딩
-- rules_id=OP03-112 script_id=880000478 fingerprint=a734774339ba94ca64e1445891af14593dd05a02bde149bce9ab1b8702ab4be5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-112]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              any={
                {
                  name_neq=[[샬롯 푸딩]],
                  trait=[[빅 맘 해적단]],
                },
                {
                  name=[[상디]],
                },
              },
            },
            look_count=4,
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
        source_text=[[【등장 시】자신의 덱 위에서 4장을 보고, 「샬롯 푸딩」 이외의 《빅 맘 해적단》 특징을 가진 카드 또는 「상디」를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-112]],
    schema_version=1,
  })
end
