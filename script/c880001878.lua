-- AUTO-GENERATED: ST11-001 / 우타
-- rules_id=ST11-001 script_id=880001878 fingerprint=57986702d53a08fcc6c40cf240be8bbd7869cfb54794d3793056b3e31718039e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST11-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              trait=[[FILM]],
            },
            look_count=1,
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
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【두웅!!×1】【어택 시】【턴 1회】자신의 덱 위에서 1장을 공개하고 《FILM》 특징을 가진 카드를 1장까지 패에 더한다. 그 후, 남은 카드를 덱 맨 아래로 되돌린다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST11-001]],
    schema_version=1,
  })
end
