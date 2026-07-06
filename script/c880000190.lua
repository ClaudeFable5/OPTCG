-- AUTO-GENERATED: OP01-067 / 크로커다일
-- rules_id=OP01-067 script_id=880000190 fingerprint=82080fc6279a444f0de22039e0092e9a950dc591d32e4af35c1289b40ce437d3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-067]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-1,
            duration=[[WHILE_CONDITION]],
            filter={
              card_type=[[EVENT]],
              color=[[BLUE]],
            },
            op=[[MODIFY_HAND_COST]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】자신의 패의 청색 이벤트의 코스트-1.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={
      [[BANISH]],
    },
    rules_id=[[OP01-067]],
    schema_version=1,
  })
end
