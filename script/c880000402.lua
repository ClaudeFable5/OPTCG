-- AUTO-GENERATED: OP03-036 / 작살
-- rules_id=OP03-036 script_id=880000402 fingerprint=eb3b4fe1f4f1d5a608e3af5c31284843c40709bd9ca241544faea0a6a318e190
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-036]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                name=[[크로]],
              },
              kind=[[LEADER_OR_CHARACTER]],
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
              trait=[[이스트 블루]],
            },
            kinds={
              [[CHARACTER]],
            },
            op=[[REST_OWN_CARD]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 《이스트 블루》 특징을 가진 캐릭터 1장을 레스트할 수 있다: 자신의 「크로」를 1장까지 액티브로 한다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=3,
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[상대의 레스트 상태이고 코스트 3 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-036]],
    schema_version=1,
  })
end
