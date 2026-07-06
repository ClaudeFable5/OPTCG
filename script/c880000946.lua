-- AUTO-GENERATED: OP07-091 / 몽키 D. 루피
-- rules_id=OP07-091 script_id=880000946 fingerprint=8e2562c3acf45710a83e374186a9cf285b2571fea5ef1a45330f682180c9c482
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-091]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[TRASH]],
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
          {
            amount_per=1000,
            divisor=3,
            duration=[[THIS_TURN]],
            filter={
              card_type=[[CHARACTER]],
              cost_gte=4,
            },
            op=[[RETURN_TRASH_ANY_FOR_POWER]],
            order=[[CHOOSE]],
            player=[[YOU]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】상대의 코스트 2 이하인 캐릭터를 1장까지 트래시로 보낸다. 그 후, 자신의 트래시에서 코스트 4 이상인 캐릭터 카드를 원하는 수만큼 원하는 순서대로 덱 맨 아래로 되돌린다. 되돌린 수 3장당, 이번 턴 동안, 이 캐릭터의 파워 +1000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-091]],
    schema_version=1,
  })
end
