-- AUTO-GENERATED: OP06-014 / 라체트
-- rules_id=OP06-014 script_id=880000748 fingerprint=121158273abcf86e7e3f290d6c1959fc93bc19b3ef2f7701120eb3896a6fae52
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-014]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount_per=1000,
            divisor=1,
            duration=[[THIS_BATTLE]],
            filter={
              trait=[[FILM]],
            },
            op=[[DISCARD_HAND_FOR_POWER]],
            player=[[YOU]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 어택 시】자신의 패에서 《FILM》 특징을 가진 카드를 원하는 수만큼 버릴 수 있다. 버린 카드 1장당, 이번 배틀 동안, 자신의 리더 또는 캐릭터 1장의 파워 +1000.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-014]],
    schema_version=1,
  })
end
