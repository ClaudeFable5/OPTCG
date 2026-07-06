-- AUTO-GENERATED: OP01-019 / 바르톨로메오
-- rules_id=OP01-019 script_id=880000142 fingerprint=17d8dc7a2e3ea33b4e43d997b8dcd8dae4d5a665591f9efe2515cde2aae48884
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-019]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=2,
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】【상대의 턴 동안】이 캐릭터의 파워 +3000.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP01-019]],
    schema_version=1,
  })
end
