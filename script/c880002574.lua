-- MANUAL: OP16-017 / 리틀 오즈 Jr. (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-017]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            amount=-4000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            filter={
              cost_gte=8,
              trait=[[흰 수염 해적단]],
            },
            negate=true,
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 코스트 8 이상인 『흰 수염 해적단』을 포함한 특징을 가진 캐릭터가 없을 경우, 이 캐릭터의 파워 -4000.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP16-017]],
    schema_version=1,
  })
end
