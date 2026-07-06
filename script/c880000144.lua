-- AUTO-GENERATED: OP01-021 / 프랑키
-- rules_id=OP01-021 script_id=880000144 fingerprint=bbbe4c8b23a6622c29bdc08c988302f5fd48c69ef49e60bdd1ecd50b539dde2e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-021]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[ALLOW_ATTACK_ACTIVE_CHARACTER]],
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
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】이 캐릭터는 상대의 액티브 상태인 캐릭터도 어택할 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-021]],
    schema_version=1,
  })
end
