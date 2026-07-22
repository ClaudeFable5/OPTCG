-- AUTO-GENERATED: OP14-031 / 나미
-- rules_id=OP14-031 script_id=880002196 fingerprint=ca81449a911ef6d0049feaf3196395098d54f34848fb9a0940e0072f50ced3b8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-031]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=2,
              filter={
                cost_lte=8,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            count=5,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
            schedule=[[THIS_TURN_END]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 코스트 8 이하인 캐릭터 2장까지를 레스트로 한다. 그 후, 이번 턴 종료 시, 자신의 두웅!! 5장까지를 액티브로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP14-031]],
    schema_version=1,
  })
end
