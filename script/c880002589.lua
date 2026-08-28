-- MANUAL: OP16-032 / 보아 행콕 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-032]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[CANNOT_BE_RESTED]],
            selector={
              count=1,
              filter={
                name_neq=[[몽키 D. 루피]],
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
        source_text=[[【등장 시】 상대의 「몽키 D. 루피」 이외의 캐릭터 1장까지는 다음 상대의 엔드 페이즈 종료 시까지 레스트로 할 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[UNBLOCKABLE]],
    },
    rules_id=[[OP16-032]],
    schema_version=1,
  })
end
