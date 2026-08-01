-- AUTO-GENERATED PROMO: P-099 / 몽키 D. 루피
-- rules_id=P-099 script_id=880002515
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-099]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            card_selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            count=1,
            op=[[SET_ACTIVE_CARD_OR_DON]],
          },
        },
        conditions={},
        costs={
          {
            count=10,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】두웅!!-10(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 이 캐릭터를 액티브로 한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[P-099]],
    schema_version=1,
  })
end
