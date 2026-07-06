-- AUTO-GENERATED: OP01-121 / 야마토
-- rules_id=OP01-121 script_id=880000244 fingerprint=966c7e597081775b09a763ffab9ab29164dae741c1f9d01be71b710833c32a7a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-121]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[RULE]],
            name=[[코즈키 오뎅]],
            op=[[ADD_NAME_ALIAS]],
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
        source_text=[[룰 상, 이 카드의 카드명은 「코즈키 오뎅」으로도 취급한다.]],
        timings={
          [[RULE]],
        },
      },
    },
    keywords={
      [[BANISH]],
      [[DOUBLE_ATTACK]],
    },
    rules_id=[[OP01-121]],
    schema_version=1,
  })
end
