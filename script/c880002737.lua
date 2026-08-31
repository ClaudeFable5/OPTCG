-- MANUAL: OP17-031 / 야솝 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-031]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=8,
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
        source_text=[[【등장 시】카드를 1장 뽑고, 상대의 코스트 8 이하인 캐릭터 1장까지를 레스트로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                trait_contains=[[빨간 머리 해적단]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 『빨간 머리 해적단』을 포함한 특징을 가진 캐릭터 1장까지를 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-031]],
    schema_version=1,
  })
end
