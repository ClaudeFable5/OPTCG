-- AUTO-GENERATED: OP15-045 / 사이
-- rules_id=OP15-045 script_id=880002347 fingerprint=83ae93630b128edbe5e755d10e5cab7cc7ca6e58b41ed8a8a8c32c52be55b46f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-045]],
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
            count=1,
            filter={
              card_type=[[EVENT]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 이벤트 1장을 버릴 수 있다: 카드를 2장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP15-045]],
    schema_version=1,
  })
end
