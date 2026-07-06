-- AUTO-GENERATED: OP03-050 / 부들
-- rules_id=OP03-050 script_id=880000416 fingerprint=0b9e72ebbebef3ad7da0bc52c482112e9960f40c27353f3603550d8a42d733d5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-050]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[OPTIONAL]],
            op=[[MILL_DECK]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 덱 위에서 1장을 트래시에 놓을 수 있다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP03-050]],
    schema_version=1,
  })
end
