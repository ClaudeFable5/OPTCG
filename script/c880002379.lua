-- AUTO-GENERATED: OP15-077 / 뇌룡
-- rules_id=OP15-077 script_id=880002379 fingerprint=bfd6acd459c4be3f2ce510588b464b2a2181b304dc46dba7908a638dae36c09b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-077]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            duration=[[UNTIL_OPPONENT_NEXT_REFRESH]],
            op=[[CANNOT_SET_ACTIVE]],
            selector={
              count=1,
              filter={
                power_lte=6000,
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】두웅!!-1: 카드를 1장 뽑는다. 그 후, 상대의 레스트 상태인 파워 6000 이하의 캐릭터 1장까지는 다음 상대의 리프레시 페이즈에 액티브가 되지 않는다.]],
        timings={
          [[MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-077]],
    schema_version=1,
  })
end
