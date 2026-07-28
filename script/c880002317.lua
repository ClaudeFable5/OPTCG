-- AUTO-GENERATED: OP15-015 / 히그마
-- rules_id=OP15-015 script_id=880002317 fingerprint=0c731b32f031764a3b4329fae1ebb63786f5b0062ef56793992db265cbcc4935
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-015]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_OPPONENT_DON]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            state=[[RESTED]],
          },
          {
            amount=-1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                don_given=true,
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
        source_text=[[【등장 시】상대의 캐릭터 1장에 상대의 레스트 상태인 두웅!! 1장까지를 붙인다. 그 후, 상대의 두웅!!이 부여된 캐릭터 1장까지는 이번 턴 동안 파워 -1000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-015]],
    schema_version=1,
  })
end
