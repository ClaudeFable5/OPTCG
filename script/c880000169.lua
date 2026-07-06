-- AUTO-GENERATED: OP01-046 / 덴지로
-- rules_id=OP01-046 script_id=880000169 fingerprint=5f67630f896d94d0c00f24c5bea67d14698a5d99690fabbb04e0f442f9095a37
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-046]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            name=[[코즈키 오뎅]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】자신의 리더가 「코즈키 오뎅」인 경우, 자신의 두웅!!을 2장까지 액티브로 한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-046]],
    schema_version=1,
  })
end
