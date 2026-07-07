-- AUTO-GENERATED: P-059 / 세계의 이어짐
-- rules_id=P-059 script_id=880002053 fingerprint=af65a2afd1456d48dd4327a204fc429e3f3cdfeb58c01c73b66633790ed23d7b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-059]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount_per=2000,
            divisor=1,
            duration=[[THIS_BATTLE]],
            filter={
              card_type=[[CHARACTER]],
            },
            op=[[RETURN_OWN_ANY_FOR_POWER]],
            player=[[YOU]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            name=[[우타]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】자신의 리더가 「우타」인 경우, 자신 필드의 캐릭터를 원하는 수만큼 패로 되돌릴 수 있다. 이번 배틀 동안, 되돌린 캐릭터 1장당 자신의 리더 또는 캐릭터 1장까지의 파워 +2000.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[P-059]],
    schema_version=1,
  })
end
