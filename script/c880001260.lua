-- AUTO-GENERATED: OP10-045 / 캐번디시
-- rules_id=OP10-045 script_id=880001260 fingerprint=4706b6469065350b586c4e33c3d6131e995c284cd719b04157cb07cf730d236b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-045]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【어택 시】【턴 1회】카드를 2장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-045]],
    schema_version=1,
  })
end
