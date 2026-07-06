-- AUTO-GENERATED: OP04-084 / 스튜시
-- rules_id=OP04-084 script_id=880000576 fingerprint=025d56e50ffc7365cad11b2936582d8a6989f14c5d383a03748dedb33c218958
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-084]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            filter={
              card_type=[[CHARACTER]],
              cost_lte=2,
              name_neq=[[스튜시]],
              trait_contains=[[CP]],
            },
            look_count=3,
            op=[[PLAY_FROM_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[TRASH]],
            rest_order=[[KEEP]],
            rested=false,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 3장을 보고, 「스튜시」 이외의 『CP』를 포함한 특징을 가진 코스트 2 이하인 캐릭터 카드를 1장까지 등장시킨다. 그 후, 남은 카드를 트래시에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-084]],
    schema_version=1,
  })
end
