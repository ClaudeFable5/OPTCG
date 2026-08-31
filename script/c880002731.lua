-- MANUAL: OP17-025 / 빌딩 스네이크 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-025]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=6,
                state=[[RESTED]],
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
        source_text=[[【KO 시】상대의 레스트 상태인 코스트 6 이하의 캐릭터 1장까지를 KO한다.]],
        timings={
          [[ON_KO]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              filter={
                name=[[샹크스]],
              },
              kind=[[LEADER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동 메인】【턴 1회】자신의 리더 「샹크스」에 레스트 상태인 두웅!! 1장까지를 부여한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-025]],
    schema_version=1,
  })
end
