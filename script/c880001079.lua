-- AUTO-GENERATED: OP08-103 / 샬롯 커스터드
-- rules_id=OP08-103 script_id=880001079 fingerprint=74150a7ed8212a83a3d23628529c14ebad18f97ceacd58df4903af8a9820d36e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-103]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 라이프 위에서 1장을 패에 더할 수 있다: 다음 상대의 턴 종료 시까지, 자신의 캐릭터 1장까지의 파워 +1000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-103]],
    schema_version=1,
  })
end
