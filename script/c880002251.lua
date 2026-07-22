-- AUTO-GENERATED: OP14-086 / 미스 더블 핑거(자라)
-- rules_id=OP14-086 script_id=880002251 fingerprint=ee5da4fafaaecf581968ba8e392db3d581292a2dd336c72ce53c8def3f3afb15
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-086]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            amount=2,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_COST]],
            selector={
              count=0,
              filter={
                trait_contains=[[바로크 워크스]],
              },
              kind=[[CHARACTER]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=7,
            op=[[TRASH_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 트래시가 7장 이상 있는 경우, 이 캐릭터의 파워 +1000 하고, 자신의 『바로크 워크스』를 포함한 특징을 가진 모든 캐릭터를 코스트 +2.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-086]],
    schema_version=1,
  })
end
