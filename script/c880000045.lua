-- AUTO-GENERATED: EB01-046 / 브룩
-- rules_id=EB01-046 script_id=880000045 fingerprint=6f17155810836a710028426c936eb17ce81ba051e73867ed7db0ade326fc3193
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-046]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
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
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_eq=0,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】/【어택 시】이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -1. 그 후, 상대의 코스트 0인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-046]],
    schema_version=1,
  })
end
