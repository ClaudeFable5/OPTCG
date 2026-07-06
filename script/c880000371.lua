-- AUTO-GENERATED: OP03-005 / 삿치
-- rules_id=OP03-005 script_id=880000371 fingerprint=d0a0a92e8bd799a87d6235eff4622de8ad2a4a625661ec7a9221f8003913e4d7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-005]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            op=[[TRASH]],
            schedule=[[THIS_TURN_END]],
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
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】이번 턴 동안, 이 캐릭터의 파워 +2000. 그 후, 이번 턴 종료 시, 이 캐릭터를 트래시에 놓는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-005]],
    schema_version=1,
  })
end
