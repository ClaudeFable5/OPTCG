-- AUTO-GENERATED: OP06-099 / 아이사
-- rules_id=OP06-099 script_id=880000833 fingerprint=069e2512f90dc974c7da48b5c483f93b0707568408f204feb58652743e2b2ed0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-099]],
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
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신 또는 상대의 라이프 위에서 1장까지를 보고, 라이프 맨 위나 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-099]],
    schema_version=1,
  })
end
