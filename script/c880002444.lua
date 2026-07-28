-- AUTO-GENERATED: EB04-023 / 차카 & 펠
-- rules_id=EB04-023 script_id=880002444 fingerprint=88ea46d007491d2775751598ce7db4a95f7bde16dc3b5775acca2700d6e65872
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-023]],
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
            amount=-5000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_OWN_POWER]],
            selector={
              count=1,
              filter={
                state=[[ACTIVE]],
              },
              kind=[[LEADER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 액티브 상태인 리더를 이번 턴 동안 파워 -5000 할 수 있다: 카드를 2장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[DOUBLE_ATTACK]],
    },
    rules_id=[[EB04-023]],
    schema_version=1,
  })
end
