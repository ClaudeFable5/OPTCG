-- AUTO-GENERATED: ST15-005 / 포트거스 D. 에이스
-- rules_id=ST15-005 script_id=880002078 fingerprint=70d1218340396e6e9df5ff25b09784ec37fbd05ffa05481594641039712b7678
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST15-005]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
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
        conditions={
          {
            op=[[LEADER_TRAIT_CONTAINS]],
            player=[[YOU]],
            trait=[[흰 수염 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 『흰 수염 해적단』을 포함한 특징을 가진 경우, 이 캐릭터는 【속공】을 얻는다.
(이 카드는 등장한 턴에 어택할 수 있다)]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_LEAVE_FIELD]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_costs={
              {
                amount=-2000,
                duration=[[THIS_TURN]],
                op=[[MODIFY_OWN_POWER]],
                selector={
                  count=1,
                  kind=[[SELF]],
                  mode=[[EXACT]],
                  owner=[[YOU]],
                },
              },
            },
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
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【턴 1회】이 캐릭터가 상대의 효과로 필드를 벗어날 경우, 대신 이번 턴 동안, 이 캐릭터의 파워를 -2000 할 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[ST15-005]],
    schema_version=1,
  })
end
