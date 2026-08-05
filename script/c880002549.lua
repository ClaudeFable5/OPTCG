-- MANUAL: ST30-009 / 리틀 오즈 Jr. (2026-08-04 ST-30 신규 세트 수동 이식)
-- EN(series 569030)/JP(series 550030) 공식 카드리스트 기준, ST29 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST30-009]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_LEAVE_FIELD]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_actions={
              {
                count=1,
                op=[[DRAW]],
                player=[[YOU]],
              },
            },
            replacement_costs={
              {
                op=[[TRASH_SELF]],
              },
            },
            selector={
              count=1,
              filter={
                base_power_eq=6000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 원래 파워 6000인 캐릭터가 상대의 효과로 필드에서 벗어날 경우, 대신 이 캐릭터를 트래시에 놓고 카드를 1장 뽑을 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[ST30-009]],
    schema_version=1,
  })
end
