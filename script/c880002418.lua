-- AUTO-GENERATED: OP15-116 / 고무고무 황금 라이플
-- rules_id=OP15-116 script_id=880002418 fingerprint=8eb8fbe5c9621d7d10f5c47c5c4e5bdc5f80ef972f247202715707b42414ea84
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-116]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[TRASH_LIFE_TOP]],
            player=[[YOU]],
          },
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
            ["then"]=true,
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[밀짚모자 일당]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 리더가 《밀짚모자 일당》 특징을 가진 경우, 자신의 라이프 위에서 1장을 트래시에 놓는다. 그 후, 자신의 덱 위에서 1장까지를 라이프 맨 위에 놓고, 자신의 패 1장을 버린다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            amount=4000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【카운터】자신의 리더는 이번 배틀 동안 파워 +4000.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-116]],
    schema_version=1,
  })
end
