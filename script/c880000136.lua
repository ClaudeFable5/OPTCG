-- AUTO-GENERATED: OP01-013 / 상디
-- rules_id=OP01-013 script_id=880000136 fingerprint=0de0d9a700829fd476fd12967767b027a5fca4a4a7e6b4df1a4fb6493ec2bc68
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-013]],
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
            count=2,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】 【턴1회】 자신의 라이프 위에서 1장을 패에 더할 수 있다: 이번 턴 동안, 이 캐릭터의 파워 +2000. 그 후, 이 캐릭터에게 레스트 상태인 두웅!!을 2장까지 부여한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-013]],
    schema_version=1,
  })
end
