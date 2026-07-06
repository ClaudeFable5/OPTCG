-- AUTO-GENERATED: OP02-001 / 에드워드 뉴게이트
-- rules_id=OP02-001 script_id=880000245 fingerprint=72c24e0d7cdb01fb79361491102f7c2d5bda717efea79e9d93390d0ab2274350
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            player=[[YOU]],
            position=[[TOP]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 라이프 위에서 1장을 패에 더한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-001]],
    schema_version=1,
  })
end
