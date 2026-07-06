-- AUTO-GENERATED: ST03-001 / 크로커다일
-- rules_id=ST03-001 script_id=880001747 fingerprint=d42851ef5412fe0581ce711ce5713fbc3b06b531280106bf5023f403b1b546d6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST03-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                cost_lte=5,
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
            count=4,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】 【턴 1회】두웅!!-4(자신 필드의 두웅!!을 지정된 수만큼 두웅!!덱으로 되돌릴 수 있다): 코스트 5 이하인 캐릭터를 1장까지 주인의 패로 되돌린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST03-001]],
    schema_version=1,
  })
end
