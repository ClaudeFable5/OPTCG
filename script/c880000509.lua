-- AUTO-GENERATED: OP04-019 / 돈키호테 도플라밍고
-- rules_id=OP04-019 script_id=880000509 fingerprint=d0519db5b12a443558382a0ff05c2c2dd0d5f8aeccc4240d5881123d9467295b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-019]],
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
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 두웅!!을 2장까지 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-019]],
    schema_version=1,
  })
end
