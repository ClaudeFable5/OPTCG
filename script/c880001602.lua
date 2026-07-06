-- AUTO-GENERATED: OP13-030 / 토니토니 쵸파
-- rules_id=OP13-030 script_id=880001602 fingerprint=8bdc8a2d35f7bfd1862f3a5cbb5830c89e42015dce63afbb6a607caf65d74ad0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-030]],
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
        source_text=[[【등장 시】자신의 두웅!!을 2장까지 액티브로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-030]],
    schema_version=1,
  })
end
