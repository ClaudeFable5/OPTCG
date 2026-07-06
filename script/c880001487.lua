-- AUTO-GENERATED: OP12-034 / 페로나
-- rules_id=OP12-034 script_id=880001487 fingerprint=c1d1f369d0680bedf3cbff218386ca43f872d66c56a200bae926a4eb7b756c3e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-034]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              any={
                {
                  attribute=[[SLASH]],
                },
                {
                  card_type=[[EVENT]],
                  color=[[GREEN]],
                },
              },
            },
            look_count=5,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            reveal=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={
          {
            attribute=[[SLASH]],
            op=[[LEADER_HAS_ATTRIBUTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 <참격> 속성을 가진 경우, 자신의 덱 위에서 5장을 보고, <참격> 속성을 가진 카드 또는 녹색 이벤트를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-034]],
    schema_version=1,
  })
end
