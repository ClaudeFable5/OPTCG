-- AUTO-GENERATED: OP06-055 / 몽키 D. 가프
-- rules_id=OP06-055 script_id=880000789 fingerprint=554e160a54bbb242f8353d692aba495156f21e7c6ff7e4ff94d9f6f105d1b0ab
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-055]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_BATTLE]],
            op=[[PREVENT_BLOCKER_ACTIVATION]],
            player=[[OPPONENT]],
          },
        },
        conditions={
          {
            count=4,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】【어택 시】자신의 패가 4장 이하인 경우, 이번 배틀 동안, 상대는 【블로커】를 발동할 수 없다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-055]],
    schema_version=1,
  })
end
