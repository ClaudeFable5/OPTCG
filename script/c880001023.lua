-- AUTO-GENERATED: OP08-047 / 조즈
-- rules_id=OP08-047 script_id=880001023 fingerprint=d58e52e803949f6bac3c5a9ad0d5732d5f798566056450f21545d4abc39a21be
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-047]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                cost_lte=6,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_OWN_CARD_TO_HAND]],
            selector={
              count=1,
              filter={
                card_type=[[CHARACTER]],
                exclude_self=true,
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】이 캐릭터 이외의 자신의 캐릭터 1장을 주인의 패로 되돌릴 수 있다: 코스트 6 이하인 캐릭터를 1장까지 주인의 패로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-047]],
    schema_version=1,
  })
end
