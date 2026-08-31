-- MANUAL: ST34-003 / 샬롯 브륄레 (2026-08-28 6색 스타트덱 ST31~36 추가)
-- JP 공홈 series 550034 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST34-003]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              trait=[[빅 맘 해적단]],
            },
            look_count=3,
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
        source_text=[[【등장 시】자신의 덱 위에서 3장을 보고, 특징 《빅 맘 해적단》을 가진 카드 1장까지를 공개하고 패에 넣는다. 그 후, 나머지를 원하는 순서로 덱 아래에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST34-003]],
    schema_version=1,
  })
end
