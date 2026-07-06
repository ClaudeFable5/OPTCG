-- AUTO-GENERATED: OP13-026 / 써니군
-- rules_id=OP13-026 script_id=880001598 fingerprint=7889769325669833462cd6cfe0ae081e8911a2122f0fbf02c861e84d83d438b3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-026]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 두웅!! 1장을 레스트할 수 있다: 다음 상대의 턴 종료 시까지, 이 캐릭터의 파워 +2000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-026]],
    schema_version=1,
  })
end
