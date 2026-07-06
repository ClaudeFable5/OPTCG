-- AUTO-GENERATED: OP09-087 / 샬롯 푸딩
-- rules_id=OP09-087 script_id=880001183 fingerprint=5c935f4eecbb6b49ae86337777f7da3d491a72d2b74065cfb58cce28bc604798
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-087]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[OPPONENT]],
          },
        },
        conditions={
          {
            count=5,
            op=[[HAND_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 패가 5장 이상인 경우, 상대는 자신의 패 1장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-087]],
    schema_version=1,
  })
end
