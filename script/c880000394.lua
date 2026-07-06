-- AUTO-GENERATED: OP03-028 / 쟝고
-- rules_id=OP03-028 script_id=880000394 fingerprint=f9606a98f82d032d79f329b22c497bd8903a336154b8b3379331009515a9bc32
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-028]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[CHOOSE]],
            options={
              {
                {
                  op=[[SET_ACTIVE]],
                  selector={
                    count=1,
                    filter={
                      any={
                        {
                          card_type=[[LEADER]],
                          trait=[[이스트 블루]],
                        },
                        {
                          card_type=[[CHARACTER]],
                          cost_lte=6,
                        },
                      },
                    },
                    kind=[[LEADER_OR_CHARACTER]],
                    mode=[[UP_TO]],
                    owner=[[YOU]],
                  },
                },
              },
              {
                {
                  op=[[REST]],
                  selector={
                    count=1,
                    kind=[[SELF]],
                    mode=[[UP_TO]],
                    owner=[[YOU]],
                  },
                },
                {
                  op=[[REST]],
                  selector={
                    count=1,
                    kind=[[CHARACTER]],
                    mode=[[UP_TO]],
                    owner=[[OPPONENT]],
                  },
                  ["then"]=true,
                },
              },
            },
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】아래에서 하나를 선택한다.
・자신의 《이스트 블루》 특징을 가진 리더 또는 코스트 6 이하인 캐릭터를 1장까지 액티브로 한다.
・이 캐릭터와 상대의 캐릭터 1장까지를 레스트로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-028]],
    schema_version=1,
  })
end
