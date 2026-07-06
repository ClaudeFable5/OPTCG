-- AUTO-GENERATED: OP10-034 / 프랑키
-- rules_id=OP10-034 script_id=880001249 fingerprint=bdaf2ca7b051d187b72a6be03d84f6b7da00f15f5d467b5a81064259c7ffc32c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-034]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_KO]],
            optional=true,
            reason=[[BATTLE]],
            replacement_costs={
              {
                count=1,
                op=[[TAKE_LIFE_TO_HAND]],
                position=[[TOP]],
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
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【턴 1회】이 캐릭터가 배틀에서 KO 당할 경우, 대신 자신의 라이프 위에서 1장을 패에 더할 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-034]],
    schema_version=1,
  })
end
