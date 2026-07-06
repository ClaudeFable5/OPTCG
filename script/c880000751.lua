-- AUTO-GENERATED: OP06-017 / 사랑의 메테오 스트라이크
-- rules_id=OP06-017 script_id=880000751 fingerprint=a1050f408c9a3e98767de07dd9d5b0ef54a305f25ed0c215aafe7999aab0a62e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-017]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
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
            position=[[ANY]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】/【카운터】자신의 라이프 1장을 패에 더할 수 있다: 이번 턴 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +3000.]],
        timings={
          [[MAIN]],
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-017]],
    schema_version=1,
  })
end
