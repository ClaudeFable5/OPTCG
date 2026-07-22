-- AUTO-GENERATED: OP14-065 / 세뇨르 핑크
-- rules_id=OP14-065 script_id=880002230 fingerprint=deaf929f1aa4769539ba558d594acaaacd18a06590c00b4fd76cc88c9fad6f5b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-065]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[EXACT]],
            op=[[RETURN_DON]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】상대는 자신 필드의 두웅!! 1장을 두웅!! 덱으로 되돌린다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-065]],
    schema_version=1,
  })
end
