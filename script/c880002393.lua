-- AUTO-GENERATED: OP15-091 / 마르가리타
-- rules_id=OP15-091 script_id=880002393 fingerprint=0e9455dcddfd8875db28a52f61a32c1c2260729c6850305bfa5f9b324b3094ea
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-091]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 트래시의 카드 1장까지를 주인의 덱 맨 아래에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-091]],
    schema_version=1,
  })
end
