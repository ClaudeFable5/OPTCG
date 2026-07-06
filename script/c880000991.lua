-- AUTO-GENERATED: OP08-015 / Dr. 쿠레하
-- rules_id=OP08-015 script_id=880000991 fingerprint=7b0f12c570edf9dd9bcda2155d599357fbe1d4dc51139f244033b86a8767e6e5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-015]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              any={
                {
                  name_neq=[[Dr. 쿠레하]],
                  trait=[[드럼 왕국]],
                },
                {
                  name=[[토니토니 쵸파]],
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
        source_text=[[【등장 시】자신의 덱 위에서 4장을 보고, 「Dr. 쿠레하」 이외의 《드럼 왕국》 특징을 가진 카드 또는 「토니토니 쵸파」를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-015]],
    schema_version=1,
  })
end
