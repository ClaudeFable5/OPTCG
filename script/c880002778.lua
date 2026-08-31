-- MANUAL: OP17-072 / 블랙마리아 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-072]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_BATTLE]],
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
            op=[[TRASH_HAND]],
          },
},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【상대의 어택 시】【턴 1회】자신의 패 1장을 버릴 수 있다：자신의 리더나 캐릭터 1장까지를 이번 배틀 동안 파워 +1000.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP17-072]],
    schema_version=1,
  })
end
