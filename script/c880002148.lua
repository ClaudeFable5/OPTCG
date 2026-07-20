-- AUTO-GENERATED: EB03-045 / 페로나
-- rules_id=EB03-045 script_id=880002148 fingerprint=1bdbb3f8aac441aeb4394231a37507df5a04d1971a423813b6e9da6054d6c97c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-045]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
          {
            actions={
              {
                count=1,
                filter={
                  card_type=[[CHARACTER]],
                  cost_lte=2,
                  trait=[[스릴러 바크 해적단]],
                },
                mode=[[UP_TO]],
                op=[[PLAY_FROM_TRASH]],
                player=[[YOU]],
                rested=true,
              },
            },
            conditions={
              {
                count=10,
                op=[[TRASH_GTE]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더 또는 캐릭터 1장에게 레스트 상태인 두웅!!을 1장까지 부여한다. 그 후, 자신의 트래시가 10장 이상인 경우, 자신의 트래시에서 코스트 2 이하인 《스릴러 바크 해적단》 특징을 가진 캐릭터 카드를 1장까지 레스트 상태로 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB03-045]],
    schema_version=1,
  })
end
