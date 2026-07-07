-- AUTO-GENERATED: P-051 / 샹크스
-- rules_id=P-051 script_id=880002045 fingerprint=174707d0e311414320c19309f8339eacd12f1c134b658cbb036a0ccc3e882392
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-051]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount_per=1000,
            divisor=1,
            duration=[[THIS_BATTLE]],
            filter={},
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
        source_text=[[【어택 시】자신의 패를 원하는 수만큼 버릴 수 있다. 버린 카드 1장당, 이번 배틀 동안, 이 캐릭터의 파워 +1000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[P-051]],
    schema_version=1,
  })
end
