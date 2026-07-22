-- AUTO-GENERATED: OP14-103 / 글로리오사 (뇽 할멈)
-- rules_id=OP14-103 script_id=880002268 fingerprint=b1b1da613b4f183da536fa631cfcf9400537747a2e7593f4bff093e8039948e1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-103]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_HAND]],
            player=[[YOU]],
            position=[[LIFE_TOP]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP_OR_BOTTOM]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 라이프 위나 아래에서 1장을 패에 더할 수 있다: 자신의 패 1장까지를 라이프 맨 위에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-103]],
    schema_version=1,
  })
end
