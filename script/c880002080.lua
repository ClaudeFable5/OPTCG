-- AUTO-GENERATED: ST16-002 / 고든
-- rules_id=ST16-002 script_id=880002080 fingerprint=6be8515fc96ebe028b66b04430225df1c6a1eda6eadfb92b6d5727bb39442296
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST16-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount_per=1000,
            divisor=1,
            duration=[[THIS_BATTLE]],
            filter={
              trait=[[음악]],
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
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【상대의 어택 시】자신의 패에서 《음악》 특징을 가진 카드를 원하는 수만큼 버릴 수 있다. 버린 카드 1장당, 이번 배틀 동안, 자신의 리더 또는 캐릭터 1장의 파워 +1000.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST16-002]],
    schema_version=1,
  })
end
