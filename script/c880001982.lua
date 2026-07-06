-- AUTO-GENERATED: ST24-003 / 바질 호킨스
-- rules_id=ST24-003 script_id=880001982 fingerprint=18c882de124dafc566e344c5ce3cdeafc998ebc17cbd28759f41535e305e8799
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST24-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 두웅!!을 1장까지 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[ST24-003]],
    schema_version=1,
  })
end
