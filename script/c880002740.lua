-- MANUAL: OP17-034 / 록스타 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-034]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[SET_BASE_POWER]],
            selector={
              count=1,
              filter={
                trait=[[빨간 머리 해적단]],
              },
              kind=[[LEADER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
            value=6000,
          },
        },
        conditions={
          {
            count=6000,
            op=[[LEADER_POWER_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동 메인】【턴 1회】상대의 리더의 파워가 6000 이상인 경우, 자신의 두웅!! 1장까지를 액티브로 한다. 그 후, 자신의 특징 《빨간 머리 해적단》을 가진 리더를 다음 상대의 엔드 페이즈 종료 시까지 원래 파워 6000으로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-034]],
    schema_version=1,
  })
end
