-- AUTO-GENERATED: OP15-098 / 몽키 D. 루피
-- rules_id=OP15-098 script_id=880002400 fingerprint=c23bf3d694f3627fce68c207360bbd0de6770d76193077eb13ec35cffc1c9293
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-098]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_LEAVE_FIELD]],
            optional=true,
            reason=[[OPPONENT_ANY]],
            replacement_costs={
              {
                count=1,
                op=[[TAKE_LIFE_TO_HAND]],
                position=[[TOP]],
              },
            },
            selector={
              count=1,
              filter={
                base_power_gte=6000,
                trait=[[하늘섬]],
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
        source_text=[[자신의 원래 파워 6000 이상인 《하늘섬》 특징을 가진 캐릭터가 상대에 의해 필드를 벗어날 경우, 대신 자신의 라이프 위에서 1장을 패에 넣을 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-098]],
    schema_version=1,
  })
end
