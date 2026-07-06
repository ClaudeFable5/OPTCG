-- AUTO-GENERATED: EB01-022 / 이나즈마
-- rules_id=EB01-022 script_id=880000021 fingerprint=001984295850686358c22b28fb9806e84eb95be6e6c7d28caef67609caad0357
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-022]],
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
        conditions={
          {
            count=2,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 패가 2장 이하인 경우, 카드를 2장 뽑는다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-022]],
    schema_version=1,
  })
end
