-- AUTO-GENERATED: ST20-003 / 샬롯 브륄레
-- rules_id=ST20-003 script_id=880002097 fingerprint=e9b46c1fc2b1f0dd7f826be10c02105d541926137e5463349cf9dcf50d072b5e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST20-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            destinations={
              [[LIFE_TOP]],
              [[LIFE_BOTTOM]],
            },
            mode=[[UP_TO]],
            op=[[LOOK_REORDER_LIFE_TOP]],
            player=[[ANY]],
          },
          {
            op=[[ADD_SELF_TO_HAND]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】자신 또는 상대의 라이프 위에서 1장까지를 보고, 라이프 맨 위나 아래로 되돌린다. 그 후, 이 카드를 패에 더한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST20-003]],
    schema_version=1,
  })
end
