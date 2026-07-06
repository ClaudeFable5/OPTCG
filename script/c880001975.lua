-- AUTO-GENERATED: ST23-001 / 우타
-- rules_id=ST23-001 script_id=880001975 fingerprint=b8576ff69ca100ffac3e18edd117272ecd907d39f7a178871f23a33a8d3af1ee
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST23-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-4,
            conditions={
              {
                filter={
                  power_gte=10000,
                },
                op=[[CHARACTER_EXISTS]],
                player=[[YOU]],
              },
            },
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_HAND_COST]],
            player=[[YOU]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[패의 이 카드는 자신의 파워 10000 이상인 캐릭터가 있을 경우, 코스트 -4.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST23-001]],
    schema_version=1,
  })
end
