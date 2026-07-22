-- AUTO-GENERATED: OP14-061 / 베르고
-- rules_id=OP14-061 script_id=880002226 fingerprint=8b0885c41b91a912ab29a9982428c0d3e7bba872637c9e33d54aa373f9c2e06d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-061]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_LEAVE_FIELD]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_costs={
              {
                count=1,
                op=[[RETURN_DON]],
              },
            },
            selector={
              count=1,
              filter={
                trait=[[돈키호테 해적단]],
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
        once_per_turn=true,
        source_text=[[【턴 1회】자신의 《돈키호테 해적단》 특징을 가진 캐릭터가 상대의 효과로 필드를 떠날 경우, 대신 자신 필드의 두웅!! 1장을 두웅!! 덱으로 되돌릴 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            amount=-2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【어택 시】두웅!!-1: 이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -2000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-061]],
    schema_version=1,
  })
end
