-- AUTO-GENERATED: OP01-062 / 크로커다일
-- rules_id=OP01-062 script_id=880000185 fingerprint=44897a28e79a220d125cdb4306e833594c3cf35a7861f270b8ff6cbb31116a91
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-062]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[OPTIONAL]],
            op=[[DRAW]],
            player=[[YOU]],
            track_source_draw=true,
          },
        },
        conditions={
          {
            count=4,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
          {
            op=[[SOURCE_EFFECT_DRAW_UNUSED_THIS_TURN]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】자신이 이벤트를 발동했을 때, 자신의 패가 4장 이하이고 이번 턴 동안 이 리더의 효과로 카드를 뽑지 않았을 경우, 카드를 1장 뽑을 수 있다.]],
        timings={
          [[ON_YOUR_EVENT_ACTIVATED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-062]],
    schema_version=1,
  })
end
