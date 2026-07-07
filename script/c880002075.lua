-- AUTO-GENERATED: ST15-001 / 아트모스
-- rules_id=ST15-001 script_id=880002075 fingerprint=2ec62fdc8cad525d864ec9639fc0159374f13228de2ef6b6ca1b9cb1526eadf5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST15-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[CANNOT_TAKE_LIFE_TO_HAND]],
            player=[[YOU]],
            reason=[[SELF_EFFECT]],
          },
        },
        conditions={
          {
            name=[[에드워드 뉴게이트]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 리더가 「에드워드 뉴게이트」인 경우, 이번 턴 동안, 자신은 자신의 효과로 라이프를 패에 더할 수 없다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST15-001]],
    schema_version=1,
  })
end
