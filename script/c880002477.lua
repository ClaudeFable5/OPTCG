-- AUTO-GENERATED: EB04-056 / 파시피스타
-- rules_id=EB04-056 script_id=880002477 fingerprint=fc3240b8e2b387d760dbec0f76b2b644fe1ee58d4b026ca066ff48430e7fbdf9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-056]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            keyword=[[BLOCKER]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            filter={
              name=[[쥬얼리 보니]],
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
          {
            count=0,
            op=[[LIFE_EQ]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 「쥬얼리 보니」가 있고 자신의 라이프가 0장인 경우, 이 캐릭터는 【블로커】를 얻는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-056]],
    schema_version=1,
  })
end
