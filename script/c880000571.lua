-- AUTO-GENERATED: OP04-079 / 올럼버스
-- rules_id=OP04-079 script_id=880000571 fingerprint=18fb94f773e9f26ee0b1f33031734c7aae14e430324dbcb72421368c25765b7b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-079]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
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
          {
            count=2,
            op=[[MILL_DECK]],
            player=[[YOU]],
            ["then"]=true,
          },
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                trait=[[드레스로자]],
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -4 하고, 자신의 덱 위에서 2장을 트래시에 놓는다. 그 후, 자신의 《드레스로자》 특징을 가진 캐릭터 1장을 KO 시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-079]],
    schema_version=1,
  })
end
