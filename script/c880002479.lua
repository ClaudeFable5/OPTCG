-- AUTO-GENERATED: EB04-058 / 보르살리노
-- rules_id=EB04-058 script_id=880002479 fingerprint=1791e55918688e2e046ae4db66689275a1fb2f69ecbffff7da7e36507f336067
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-058]],
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
        conditions={
          {
            count=2,
            op=[[LIFE_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 라이프가 2장 이하인 경우, 자신의 덱 위에서 1장까지를 라이프 맨 위에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB04-058]],
    schema_version=1,
  })
end
