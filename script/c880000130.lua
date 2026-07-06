-- AUTO-GENERATED: OP01-007 / 카리브
-- rules_id=OP01-007 script_id=880000130 fingerprint=688489f2b5e84bb64cc0887cb311a639453ee7b02c641fce70f34e6104b57635
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-007]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                power_lte=4000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】 상대의 파워 4000 이하인 캐릭터를 1장까지 KO시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-007]],
    schema_version=1,
  })
end
