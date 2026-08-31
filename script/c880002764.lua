-- MANUAL: OP17-058 / 카이도 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-058]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            amount=-2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【어택 시】/【상대의 어택 시】【턴 1회】두웅!!-1：상대의 캐릭터 1장까지를 이번 턴 동안 파워 -2000.]],
        timings={
          [[WHEN_ATTACKING]],
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-058]],
    schema_version=1,
  })
end
