-- AUTO-GENERATED: OP09-088 / 시류
-- rules_id=OP09-088 script_id=880001184 fingerprint=48d71ba8ee3a2b9609054c4f622506f2b57763fcc90115d92b584380613e1c2d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-088]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=2,
            op=[[TRASH_HAND]],
          },
        },
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】자신의 패 2장을 버릴 수 있다: 카드를 2장 뽑는다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-088]],
    schema_version=1,
  })
end
