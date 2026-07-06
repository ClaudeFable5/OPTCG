-- AUTO-GENERATED: OP08-072 / 비스킷 병사
-- rules_id=OP08-072 script_id=880001048 fingerprint=97b04072a7007b6591cad0721411e3b812dc8575ac3334ff92c60fe26de9abe5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-072]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[RULE]],
            op=[[ALLOW_UNLIMITED_DECK_COPIES]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[룰상, 이 카드는 덱에 몇 장이든 넣을 수 있다.]],
        timings={
          [[RULE]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP08-072]],
    schema_version=1,
  })
end
