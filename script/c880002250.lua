-- AUTO-GENERATED: OP14-085 / 미스 골든위크(마리안느)
-- rules_id=OP14-085 script_id=880002250 fingerprint=185c33aaa8ebd1fe0df165b0a9b7dbb058f83084f8f4248909ab67f357aae3bf
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-085]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=2,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】카드를 2장 뽑고, 자신의 패 2장을 버린다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-085]],
    schema_version=1,
  })
end
