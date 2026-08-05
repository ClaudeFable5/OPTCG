-- MANUAL: ST30-010 / 크로커다일 (2026-08-04 ST-30 신규 세트 수동 이식)
-- EN(series 569030)/JP(series 550030) 공식 카드리스트 기준, ST29 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST30-010]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_REFRESH]],
            op=[[CANNOT_SET_ACTIVE]],
            selector={
              count=1,
              filter={
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
        source_text=[[【등장 시】상대의 레스트 상태인 캐릭터 1장까지는 다음 상대의 리프레시 페이즈에 액티브가 되지 않는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST30-010]],
    schema_version=1,
  })
end
