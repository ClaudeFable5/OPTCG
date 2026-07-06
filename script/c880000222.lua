-- AUTO-GENERATED: OP01-099 / 쿠로즈미 세미마루
-- rules_id=OP01-099 script_id=880000222 fingerprint=254e6f88d2114fadee49ddc2ce9d2050125f9dda43f85fe6cd5ee03ef35cd63a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-099]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_BE_KO]],
            reason=[[BATTLE]],
            selector={
              count=0,
              filter={
                name_neq=[[쿠로즈미 세미마루]],
                trait=[[쿠로즈미 가문]],
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
        source_text=[[자신의 「쿠로즈미 세미마루」 이외의 《쿠로즈미 가문》 특징을 가진 캐릭터는 배틀에 의해 KO 당하지 않는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-099]],
    schema_version=1,
  })
end
