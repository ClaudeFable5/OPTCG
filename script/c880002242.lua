-- AUTO-GENERATED: OP14-077 / 오색실
-- rules_id=OP14-077 script_id=880002242 fingerprint=13711ef85dd4a12d9f3a3d9bffdf0cc2adc62ad90537a78309651aee728cc358
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-077]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=4000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            actions={
              {
                count=1,
                mode=[[UP_TO]],
                op=[[ADD_DON]],
                state=[[RESTED]],
              },
            },
            conditions={
              {
                filter={
                  power_gte=6000,
                },
                op=[[CHARACTER_EXISTS]],
                player=[[OPPONENT]],
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
        source_text=[[【카운터】이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +4000. 그 후, 상대의 파워가 6000 이상인 캐릭터가 있는 경우, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-077]],
    schema_version=1,
  })
end
