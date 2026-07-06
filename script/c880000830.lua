-- AUTO-GENERATED: OP06-096 / …아무 일!!! 없었다…!!!!
-- rules_id=OP06-096 script_id=880000830 fingerprint=334a586f3daed441d56a129c3efdb007aa65d99f5d1674232d38d8a1e1892ea8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-096]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[CANNOT_BE_KO]],
            reason=[[BATTLE]],
            selector={
              count=0,
              filter={
                cost_lte=7,
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】자신의 라이프 위에서 1장을 패에 더할 수 있다: 이번 턴 동안, 자신의 코스트 7 이하인 모든 캐릭터는 배틀에서는 KO 당하지 않는다.]],
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
    rules_id=[[OP06-096]],
    schema_version=1,
  })
end
