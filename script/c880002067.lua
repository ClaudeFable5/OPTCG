-- AUTO-GENERATED: P-095 / 상디
-- rules_id=P-095 script_id=880002067 fingerprint=cbe66216f1c812c0a4696e78b0b584b2579dfe824cd614d1868c167f7867b9c1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-095]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              card_type=[[EVENT]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【상대의 어택 시】【턴 1회】자신의 패에서 이벤트 1장을 버릴 수 있다: 이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +2000.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={},
    rules_id=[[P-095]],
    schema_version=1,
  })
end
