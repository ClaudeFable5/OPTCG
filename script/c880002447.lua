-- AUTO-GENERATED: EB04-026 / 블루글래스
-- rules_id=EB04-026 script_id=880002447 fingerprint=ccdd7e8569e0b49bf78d4b53612f0730e5f097cfcc007363ef7700ed2eab5a0b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-026]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_DECK_BOTTOM]],
            selector={
              count=1,
              filter={
                cost_lte=1,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 코스트 1 이하인 캐릭터 1장까지를 주인의 덱 맨 아래에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【어택 시】카드를 1장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-026]],
    schema_version=1,
  })
end
