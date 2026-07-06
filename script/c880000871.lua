-- AUTO-GENERATED: OP07-018 / KEEP OUT
-- rules_id=OP07-018 script_id=880000871 fingerprint=0943b656084ef339fc4cf7369d9eb5f40713ccb3060562de9da5c3cdbeee93fb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-018]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[UNTIL_YOUR_NEXT_TURN_END]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                trait=[[혁명군]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】다음 자신의 턴 종료 시까지, 자신의 《혁명군》 특징을 가진 캐릭터 1장까지의 파워 +2000.]],
        timings={
          [[COUNTER]],
        },
      },
      {
        actions={
          {
            effect_timing=[[COUNTER]],
            op=[[ACTIVATE_CARD_EFFECT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드의 【카운터】 효과를 발동한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-018]],
    schema_version=1,
  })
end
