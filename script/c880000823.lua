-- AUTO-GENERATED: OP06-089 / 타라란
-- rules_id=OP06-089 script_id=880000823 fingerprint=6896a6cf85d8dc035bd49a4cfd5f8b78f89fd51dcc773d49dd463e4bde46984d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-089]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=3,
            op=[[MILL_DECK]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】/【KO 시】자신의 덱 위에서 3장을 트래시에 놓는다.]],
        timings={
          [[ON_PLAY]],
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-089]],
    schema_version=1,
  })
end
