-- AUTO-GENERATED: OP13-047 / 포사
-- rules_id=OP13-047 script_id=880001619 fingerprint=ccf5a88b771c6df548a3ea1a2d1744817ae582ce6a7ed07d9630ad90567ac555
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-047]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_KO]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_costs={
              {
                op=[[TRASH_SELF]],
              },
            },
            selector={
              count=0,
              filter={
                trait_contains=[[흰 수염 해적단]],
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
        source_text=[[자신의 『흰 수염 해적단』을 포함한 특징을 가진 캐릭터가 상대의 효과로 KO 당할 경우, 대신 이 캐릭터를 트래시에 놓을 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-047]],
    schema_version=1,
  })
end
