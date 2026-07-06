-- AUTO-GENERATED: OP06-039 / 너로는 심심풀이도 되지 않는다!!!
-- rules_id=OP06-039 script_id=880000773 fingerprint=1dcbdb7bbf04abebb3173b84b7e7bc8f501f9b7ed132a86a21c4264f308f0097
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-039]],
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
                      cost_lte=6,
                    },
                    kind=[[CHARACTER]],
                    mode=[[UP_TO]],
                    owner=[[OPPONENT]],
                  },
                },
              },
              {
                {
                  op=[[KO]],
                  selector={
                    count=1,
                    filter={
                      cost_lte=6,
                      state=[[RESTED]],
                    },
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
        once_per_turn=false,
        source_text=[[【메인】아래에서 하나를 선택한다.
・상대의 코스트 6 이하인 캐릭터를 1장까지 레스트로 한다.
・상대의 레스트 상태이고 코스트 6 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            effect_timing=[[MAIN]],
            op=[[ACTIVATE_CARD_EFFECT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드의 【메인】 효과를 발동한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-039]],
    schema_version=1,
  })
end
