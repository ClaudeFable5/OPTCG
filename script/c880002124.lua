-- AUTO-GENERATED: EB03-021 / 알비다
-- rules_id=EB03-021 script_id=880002124 fingerprint=3aacd7942d871ee0a04f939fa76ecef59409db8acfd3647c61c751c4fc23334f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-021]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_DECK_BOTTOM]],
            selector={
              count=1,
              filter={
                base_power_lte=4000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            op=[[RETURN_TO_DECK_BOTTOM]],
            selector={
              count=1,
              filter={
                base_cost_lte=3,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패 1장을 버릴 수 있다: 상대의 원래 파워가 4000 이하인 캐릭터 1장까지와 원래 코스트가 3 이하인 캐릭터를 1장까지 주인의 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-021]],
    schema_version=1,
  })
end
