-- AUTO-GENERATED: OP04-021 / 비올라
-- rules_id=OP04-021 script_id=880000511 fingerprint=7d1673292dcaa0c3748e7cd6060dce88774592ffe51e1a9b2dc90a25e3b221f5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-021]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[REST_DON]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={
          {
            count=2,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 어택 시】2(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다): 상대의 두웅!!을 1장까지 레스트로 한다.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-021]],
    schema_version=1,
  })
end
