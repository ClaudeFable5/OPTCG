-- MANUAL: OP17-017 / 그라라라라라라!!! (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-017]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                trait_contains=[[흰 수염 해적단]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            amount=-2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】자신의 『흰 수염 해적단』을 포함한 특징을 가진 리더나 캐릭터 1장까지를 이번 배틀 동안 파워 +2000. 그 후, 상대의 리더나 캐릭터 1장까지를 이번 턴 동안 파워 -2000.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-017]],
    schema_version=1,
  })
end
