-- AUTO-GENERATED: OP10-070 / 트레볼
-- rules_id=OP10-070 script_id=880001285 fingerprint=754a21df41d9409cd194c947ccc671db3b6b2e13ca13bf31bc111f4ccf0bb8d8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-070]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[CANNOT_BE_KO]],
            reason=[[OPPONENT_EFFECT]],
            selector={
              count=0,
              filter={
                base_power_lte=1000,
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】다음 상대의 턴 종료 시까지, 자신의 원래 파워가 1000 이하인 모든 캐릭터는 상대의 효과로는 KO 당하지 않는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP10-070]],
    schema_version=1,
  })
end
