-- AUTO-GENERATED: ST11-002 / 우타
-- rules_id=ST11-002 script_id=880001879 fingerprint=bbef8314fb1d1726e3304ecb8f7c3917a5f26561eb5dd1afa670bd1c0796e337
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST11-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
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
            count=1,
            filter={
              card_type=[[EVENT]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 패에서 이벤트 1장을 버릴 수 있다: 자신의 《FILM》 특징을 가진 캐릭터를 1장까지 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST11-002]],
    schema_version=1,
  })
end
