-- AUTO-GENERATED: P-057 / 물거품 자장가
-- rules_id=P-057 script_id=880002051 fingerprint=3e7dd4478c31586d8b5ebf26de1818351ac61665418872267cee14c085f65ed3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-057]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_REFRESH]],
            op=[[CANNOT_SET_ACTIVE]],
            selector={
              count=2,
              filter={
                cost_lte=4,
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            name=[[우타]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 리더가 「우타」인 경우, 상대의 레스트 상태이고 코스트 4 이하인 캐릭터 2장까지는 다음 상대의 리프레시 페이즈에 액티브 되지 않는다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            effect_timing=[[MAIN]],
            op=[[ACTIVATE_CARD_EFFECT]],
          },
        },
        conditions={
          {
            op=[[LIFE_TRIGGER_ACTIVATED]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】이 카드의 【메인】 효과를 발동한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[P-057]],
    schema_version=1,
  })
end
