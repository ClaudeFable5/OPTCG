-- AUTO-GENERATED: P-029 / 바르톨로메오
-- rules_id=P-029 script_id=880002031 fingerprint=e2af8015267b9f54f1f3e944b867f4272723ec682241bce0f7734d2b350c1d36
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-029]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                name_neq=[[바르톨로메오]],
                trait=[[FILM]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】 이 캐릭터를 레스트할 수 있다: 자신의 「바르톨로메오」 이외의 《FILM》 특징을 가진 캐릭터를 1장까지 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[P-029]],
    schema_version=1,
  })
end
