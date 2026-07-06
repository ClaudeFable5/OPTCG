-- AUTO-GENERATED: OP10-003 / 슈거
-- rules_id=OP10-003 script_id=880001218 fingerprint=de6e1049d3b7f90b3c4578af3a00518062ff3efa8ff5613f125ad7d637982af0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            actions={
              {
                count=1,
                mode=[[UP_TO]],
                op=[[SET_DON_ACTIVE]],
                player=[[YOU]],
              },
            },
            conditions={
              {
                filter={
                  power_gte=6000,
                  trait=[[돈키호테 해적단]],
                },
                op=[[CHARACTER_EXISTS]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 파워 6000 이상인 《돈키호테 해적단》 특징을 가진 캐릭터가 있을 경우, 자신의 두웅!!을 1장까지 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[ACTIVE]],
          },
        },
        conditions={
          {
            op=[[OPPONENT_TURN]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【상대의 턴 동안】【턴 1회】자신이 이벤트를 발동했을 때, 두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[ON_YOUR_EVENT_ACTIVATED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-003]],
    schema_version=1,
  })
end
