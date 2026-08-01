-- AUTO-GENERATED PROMO: P-106 / 몽키 D. 루피
-- rules_id=P-106 script_id=880002522
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-106]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            card_selector={
              count=1,
              filter={
                trait=[[에그 헤드]],
              },
              kind=[[CHARACTER]],
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
            count=1,
            op=[[FLIP_LIFE_TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 라이프 위에서 1장을 앞면으로 할 수 있다: 자신의 《에그 헤드》 특징을 가진 캐릭터 1장까지를 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[P-106]],
    schema_version=1,
  })
end
