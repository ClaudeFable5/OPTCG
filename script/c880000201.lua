-- AUTO-GENERATED: OP01-078 / 보아 행콕
-- rules_id=OP01-078 script_id=880000201 fingerprint=575bafc42cacb5f6e13b19dbe9dbc67777d88868a44344aff3d6c367ca614ffd
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-078]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            count=5,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】/【블록 시】자신의 패가 5장 이하인 경우, 카드를 1장 뽑는다.]],
        timings={
          [[WHEN_ATTACKING]],
          [[ON_BLOCK]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP01-078]],
    schema_version=1,
  })
end
