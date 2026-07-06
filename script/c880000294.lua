-- AUTO-GENERATED: OP02-049 / 엠포리오 이반코프
-- rules_id=OP02-049 script_id=880000294 fingerprint=49eed72d42c553f1f5394d3fe3b82d455f2f8cf5a40a3ac664e6076b02d399ed
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-049]],
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
            count=0,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
          {
            count=0,
            op=[[HAND_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 패가 0장인 경우, 카드를 2장 뽑는다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-049]],
    schema_version=1,
  })
end
