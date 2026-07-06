-- AUTO-GENERATED: PRB02-004 / 쥬얼리 보니
-- rules_id=PRB02-004 script_id=880001696 fingerprint=5cb0e5b948afad24b0da586bae9df48753547ce3a0f7ddb7acfd565f179c598c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[PRB02-004]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【상대의 어택 시】【턴 1회】자신의 두웅!!을 1장까지 액티브로 한다.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[PRB02-004]],
    schema_version=1,
  })
end
