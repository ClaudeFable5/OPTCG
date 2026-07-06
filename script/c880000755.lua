-- AUTO-GENERATED: OP06-021 / 페로나
-- rules_id=OP06-021 script_id=880000755 fingerprint=6cee828bc8fe76d0f9992a5a95a69c6ec566834e5efb4f1d7ce4eda1b5011b49
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-021]],
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
                  op=[[REST]],
                  selector={
                    count=1,
                    filter={
                      cost_lte=4,
                    },
                    kind=[[CHARACTER]],
                    mode=[[UP_TO]],
                    owner=[[OPPONENT]],
                  },
                },
              },
              {
                {
                  amount=-1,
                  duration=[[THIS_TURN]],
                  op=[[MODIFY_COST]],
                  selector={
                    count=1,
                    kind=[[CHARACTER]],
                    mode=[[UP_TO]],
                    owner=[[OPPONENT]],
                  },
                },
              },
            },
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】아래에서 하나를 선택한다.
・상대의 코스트 4 이하인 캐릭터를 1장까지 레스트로 한다.
・이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -1.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-021]],
    schema_version=1,
  })
end
