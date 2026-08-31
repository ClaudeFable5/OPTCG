-- MANUAL: OP17-030 / 몽키 D. 루피 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-030]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[RUSH]],
            op=[[GAIN_KEYWORD]],
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
        once_per_turn=false,
        source_text=[[【등장 시】자신의 두웅!! 1장을 레스트로 할 수 있다：이 캐릭터는 이번 턴 동안 【속공】을 얻는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            count=5,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동 메인】【턴 1회】자신의 패가 5장 이하인 경우, 자신의 두웅!! 1장까지를 액티브로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-030]],
    schema_version=1,
  })
end
