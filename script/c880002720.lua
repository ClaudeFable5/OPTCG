-- MANUAL: OP17-014 / 화이티 베이 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-014]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                base_power_lte=2000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 원래 파워 2000 이하인 캐릭터 1장까지를 KO한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【상대의 어택 시】이 캐릭터를 트래시에 놓을 수 있다：자신의 리더를 이번 배틀 동안 파워 +1000.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-014]],
    schema_version=1,
  })
end
