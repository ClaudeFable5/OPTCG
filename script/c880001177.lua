-- AUTO-GENERATED: OP09-081 / 마샬 D. 티치
-- rules_id=OP09-081 script_id=880001177 fingerprint=5ac655485b3da6107cfff42a7fbd7f4daf30ff6086d046a1652ecc451e5c69af
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-081]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[NEGATE_TIMING_EFFECTS]],
            player=[[YOU]],
            timing=[[ON_PLAY]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 【등장 시】 효과는 무효가 된다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[NEGATE_TIMING_EFFECTS]],
            player=[[OPPONENT]],
            timing=[[ON_PLAY]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【기동: 메인】자신의 패 1장을 버릴 수 있다: 다음 상대의 턴 종료 시까지, 상대의 【등장 시】 효과는 무효가 된다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-081]],
    schema_version=1,
  })
end
