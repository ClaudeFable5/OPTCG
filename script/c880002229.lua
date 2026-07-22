-- AUTO-GENERATED: OP14-064 / 조라
-- rules_id=OP14-064 script_id=880002229 fingerprint=775d0f6740516ad7b7a20c70b4f363b9869125aec4231e8e2cfa20eaa93debbb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-064]],
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
            op=[[KO]],
            selector={
              count=1,
              filter={
                base_power_eq=0,
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
        source_text=[[【KO 시】두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다. 그 후, 상대의 원래 파워가 0인 캐릭터 1장까지를 KO 시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-064]],
    schema_version=1,
  })
end
