-- AUTO-GENERATED: OP14-075 / 라오 G
-- rules_id=OP14-075 script_id=880002240 fingerprint=3cc9afc716590d56e95f34f92e0555bc3bb49fe8a1302d6cb2e1b7e484a3ab35
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-075]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
          {
            amount=-2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
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
        source_text=[[【KO 시】두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다. 그 후, 이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -2000.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-075]],
    schema_version=1,
  })
end
