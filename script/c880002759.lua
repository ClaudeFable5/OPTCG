-- MANUAL: OP17-053 / 바벨 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-053]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[RETURN_HAND_TO_DECK]],
            order=[[CHOOSE]],
            player=[[OPPONENT]],
            positions={
              [[DECK_BOTTOM]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】상대는 자신의 패 2장을 원하는 순서로 덱 아래에 놓는다.]],
        timings={
          [[ON_KO]],
        },
      },
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_TURN]],
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
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동 메인】【턴 1회】자신의 패 1장을 버릴 수 있다：이 캐릭터는 이번 턴 동안 파워 +3000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-053]],
    schema_version=1,
  })
end
