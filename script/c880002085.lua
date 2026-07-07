-- AUTO-GENERATED: ST17-003 / 버기
-- rules_id=ST17-003 script_id=880002085 fingerprint=3575e042204656409b3840f40fe0d39301d7b5d73676966e5bb998f22275140d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST17-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=3,
            destinations={
              [[DECK_TOP]],
            },
            op=[[LOOK_REORDER_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 3장을 보고, 원하는 순서대로 덱 맨 위로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST17-003]],
    schema_version=1,
  })
end
