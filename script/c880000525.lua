-- AUTO-GENERATED: OP04-034 / 라오 G
-- rules_id=OP04-034 script_id=880000525 fingerprint=7c7886bd5bb6a0fcfcb550f53c0486e8212fff77a6fa6f7784605d64162892b6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-034]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=3,
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            count=3,
            op=[[ACTIVE_DON_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 액티브 상태인 두웅!!이 3장 이상인 경우, 상대의 레스트 상태이고 코스트 3 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-034]],
    schema_version=1,
  })
end
