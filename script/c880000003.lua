-- AUTO-GENERATED: EB01-004 / 코자
-- rules_id=EB01-004 script_id=880000003 fingerprint=9d3c0d7839d722d384c1b84660ab4e6af75101a09f5558ad6f023c5274a7e24b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-004]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-3000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            amount=-5000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_OWN_POWER]],
            selector={
              count=1,
              filter={
                state=[[ACTIVE]],
              },
              kind=[[LEADER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】이번 턴 동안, 자신의 액티브 상태인 리더 1장의 파워를 -5000 할 수 있다: 이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -3000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-004]],
    schema_version=1,
  })
end
