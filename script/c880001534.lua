-- AUTO-GENERATED: OP12-081 / 코알라
-- rules_id=OP12-081 script_id=880001534 fingerprint=17dec6808a314db926bab71f17cfa7235626df4e358da0bd0351b7fa7d2ccf11
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-081]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            count=2,
            filter={
              cost_gte=8,
            },
            op=[[CHARACTER_COUNT_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 리더가 상대의 리더를 어택했을 때, 자신의 코스트 8 이상인 캐릭터가 2장 이상인 경우, 카드를 1장 뽑는다.]],
        timings={
          [[WHEN_ATTACKING_OPPONENT_LEADER]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            player=[[OPPONENT]],
            position=[[TOP]],
          },
        },
        conditions={
          {
            count=8,
            op=[[EVENT_TARGET_BASE_COST_GTE_OR_EFFECT_PLAY]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【턴 1회】상대가 원래 코스트가 8 이상인 캐릭터를 등장시켰을 때 또는 캐릭터의 효과로 캐릭터를 등장시켰을 때, 발동할 수 있다. 상대는 자신의 라이프 위에서 1장을 패에 더한다.]],
        timings={
          [[ON_OPPONENT_HIGH_COST_OR_EFFECT_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-081]],
    schema_version=1,
  })
end
