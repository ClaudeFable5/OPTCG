-- AUTO-GENERATED: OP07-052 / 보아 마리골드
-- rules_id=OP07-052 script_id=880000907 fingerprint=949f94d2bbc5b5c6fca9f0a180ece23a6f0e316b4d04a1a63f29c54daa04ed3e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-052]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_DECK_BOTTOM]],
            selector={
              count=1,
              filter={
                cost_lte=2,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
          },
        },
        conditions={
          {
            count=2,
            filter={
              trait_any={
                [[아마존 릴리]],
                [[구사 해적단]],
              },
            },
            op=[[CHARACTER_COUNT_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신 필드에 《아마존 릴리》 또는 《구사 해적단》 특징을 가진 캐릭터가 2장 이상인 경우, 코스트 2 이하인 캐릭터를 1장까지 주인의 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-052]],
    schema_version=1,
  })
end
