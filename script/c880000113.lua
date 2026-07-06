-- AUTO-GENERATED: EB02-051 / 콧노래 삼백보 오늬 가르기
-- rules_id=EB02-051 script_id=880000113 fingerprint=9add45355bbb8d8fc87a9e537af175be78a015368d7f4917a82462f4407dad37
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-051]],
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
                  op=[[KO]],
                  selector={
                    count=1,
                    filter={
                      cost_lte=2,
                    },
                    kind=[[CHARACTER]],
                    mode=[[UP_TO]],
                    owner=[[OPPONENT]],
                  },
                },
              },
              {
                {
                  amount=-4,
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
        once_per_turn=false,
        source_text=[[【메인】아래에서 하나를 선택한다.
・상대의 코스트 2 이하인 캐릭터를 1장까지 KO 시킨다.
・이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -4.]],
        timings={
          [[MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-051]],
    schema_version=1,
  })
end
