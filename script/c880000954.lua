-- AUTO-GENERATED: OP07-099 / 우솝
-- rules_id=OP07-099 script_id=880000954 fingerprint=3cdad2c44b22216c8226b00bb612ffca85e5a4f1f8c047275886fe9cdf93c6d3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-099]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[UNTIL_YOUR_NEXT_TURN_END]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                trait=[[에그 헤드]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[다음 자신의 턴 종료 시까지, 자신의 《에그 헤드》 특징을 가진 리더 또는 캐릭터 1장까지의 파워 +2000.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-099]],
    schema_version=1,
  })
end
