-- AUTO-GENERATED: OP01-074 / 바솔로뮤 쿠마
-- rules_id=OP01-074 script_id=880000197 fingerprint=b4747863c01dbe309ab3bd0b80abd8146e527316425663948fcd96fa46fe802b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-074]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              cost_lte=4,
              name=[[파시피스타]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 패에서 코스트 4 이하인 「파시피스타」를 1장까지 등장시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP01-074]],
    schema_version=1,
  })
end
