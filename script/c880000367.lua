-- AUTO-GENERATED: OP03-001 / 포트거스 D. 에이스
-- rules_id=OP03-001 script_id=880000367 fingerprint=08ea09b829297eeac93c8a4889075ae1f15d34c6d14e1a0accddb13dfc2de10b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount_per=1000,
            divisor=1,
            duration=[[THIS_BATTLE]],
            filter={
              card_type_any={
                [[EVENT]],
                [[STAGE]],
              },
            },
            op=[[DISCARD_HAND_FOR_POWER]],
            player=[[YOU]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 리더가 어택했을 때나 어택당했을 때, 자신의 패에서 원하는 수의 이벤트나 스테이지 카드를 버릴 수 있다. 버린 카드 1장당, 이번 배틀 동안, 이 리더의 파워 +1000.]],
        timings={
          [[WHEN_ATTACKING_OR_ATTACKED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-001]],
    schema_version=1,
  })
end
