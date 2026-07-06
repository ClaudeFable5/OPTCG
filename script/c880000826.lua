-- AUTO-GENERATED: OP06-092 / 브룩
-- rules_id=OP06-092 script_id=880000826 fingerprint=6075fd83acd0678eff597af7ec540f3b263860c0822419b36e664ad1d10a0e23
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-092]],
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
                  op=[[TRASH]],
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
                  count=3,
                  filter={},
                  op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
                  order=[[CHOOSE]],
                  player=[[OPPONENT]],
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
・상대의 코스트 4 이하인 캐릭터를 1장까지 트래시로 보낸다.
・상대는 자신의 트래시에서 카드 3장을 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-092]],
    schema_version=1,
  })
end
