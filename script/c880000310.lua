-- AUTO-GENERATED: OP02-065 / Mr.3 (갤디노)
-- rules_id=OP02-065 script_id=880000310 fingerprint=f5de57a63f42578bb3ab36f7ca8d29fb2223769c686c4969e5c35b064f1e8b53
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-065]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 패 1장을 버릴 수 있다: 이 캐릭터를 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP02-065]],
    schema_version=1,
  })
end
