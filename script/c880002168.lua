-- AUTO-GENERATED: OP14-003 / 카포네 벳지
-- rules_id=OP14-003 script_id=880002168 fingerprint=d00b99bfd169be438656190fed998a956ae15270c28789ba3b01251b68131928
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_BE_KO]],
            reason=[[CHARACTER_EFFECT]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            source_filter={
              base_power_lte=5000,
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 캐릭터는 상대의 원래 파워가 5000 이하인 캐릭터의 효과로 KO 되지 않는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-003]],
    schema_version=1,
  })
end
