-- AUTO-GENERATED: OP04-047 / 빙귀
-- rules_id=OP04-047 script_id=880000539 fingerprint=63218867087420767e279d9663fc3a827e8d14e6eae0082918f106afe95fdaa7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-047]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_DECK_BOTTOM]],
            selector={
              count=1,
              kind=[[EVENT_TARGET]],
              mode=[[UP_TO]],
              owner=[[CONTEXT]],
            },
          },
        },
        conditions={
          {
            count=5,
            op=[[EVENT_TARGET_BASE_COST_LTE]],
          },
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】이 캐릭터가 상대의 코스트 5 이하인 캐릭터와 배틀한 배틀 종료 시, 배틀한 상대의 캐릭터를 주인의 덱 맨 아래로 되돌린다.]],
        timings={
          [[AFTER_BATTLE_WITH_OPPONENT_CHARACTER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-047]],
    schema_version=1,
  })
end
