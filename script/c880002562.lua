-- MANUAL: OP16-005 / 삿치 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-005]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            amount=-3,
            op=[[MODIFY_HAND_COST]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            filter={
              power_gte=8000,
              trait=[[흰 수염 해적단]],
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[패의 이 카드는 자신의 파워 8000 이상인 『흰 수염 해적단』을 포함한 특징을 가진 캐릭터가 있을 경우, 코스트 -3.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP16-005]],
    schema_version=1,
  })
end
