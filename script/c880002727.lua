-- MANUAL: OP17-021 / 오리 할멈 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-021]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            op=[[REPLACE_LEAVE_FIELD]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_costs={
              {
                count=1,
                filter={},
                op=[[REST_OWN_CARD]],
              },
            },
            selector={
              count=1,
              filter={
                trait_contains=[[빨간 머리 해적단]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 『빨간 머리 해적단』을 포함한 특징을 가진 캐릭터가 상대의 효과로 필드를 벗어날 경우, 대신 자신의 카드 1장을 레스트로 할 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-021]],
    schema_version=1,
  })
end
