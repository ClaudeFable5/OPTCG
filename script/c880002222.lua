-- AUTO-GENERATED: OP14-057 / 안심해라!! 내가 있다!!!
-- rules_id=OP14-057 script_id=880002222 fingerprint=c54826fdab2b91d5fd265253e9132df35a4e457a5916fdd0cfdde43f69a29a47
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-057]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=0,
              filter={
                trait_any={
                  [[어인족]],
                  [[인어족]],
                },
              },
              kind=[[LEADER_OR_CHARACTER]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】이번 턴 동안, 자신의 《어인족》이나 《인어족》 특징을 가진 리더와 모든 캐릭터의 파워 +1000.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[카드를 2장 뽑는다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-057]],
    schema_version=1,
  })
end
