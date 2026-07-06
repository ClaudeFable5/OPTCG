-- AUTO-GENERATED: OP02-029 / 캐럿
-- rules_id=OP02-029 script_id=880000273 fingerprint=46d266059797beea6786cda8ac71f2be7574d0b4af1c5e079e3e1c0552081a0d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-029]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 두웅!!을 1장까지 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-029]],
    schema_version=1,
  })
end
