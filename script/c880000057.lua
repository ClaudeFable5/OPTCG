-- AUTO-GENERATED: EB01-057 / 시라호시
-- rules_id=EB01-057@c66a4bc33636 script_id=880000057 fingerprint=c66a4bc33636f19c1396289a4b99a0639d0f0b72becde54602f1ce4ba4801374
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-057]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 캐릭터가 상대의 효과로 KO 당했을 때, 자신의 덱 위에서 1장까지를 라이프 맨 위에 더한다.]],
        timings={
          [[ON_KO_BY_OPPONENT_EFFECT]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB01-057@c66a4bc33636]],
    schema_version=1,
  })
end
