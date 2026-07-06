-- AUTO-GENERATED: OP09-032 / 돈키호테 로시난테
-- rules_id=OP09-032 script_id=880001127 fingerprint=d503901b554d0b76df3aad9886c1d66338c8f58da4ff891a063d5cfac1c0d454
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-032]],
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
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【상대의 어택 시】【턴 1회】이 캐릭터를 액티브로 한다.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP09-032]],
    schema_version=1,
  })
end
