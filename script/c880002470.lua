-- AUTO-GENERATED: EB04-049 / 지건 황련
-- rules_id=EB04-049 script_id=880002470 fingerprint=9e0fbb797b326b8d5941c3a896c2c58bd1bc24f1cec18342376997da916582fe
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-049]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                base_cost_lte=5,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=2,
            op=[[MILL_DECK]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 덱 위에서 2장을 트래시에 놓을 수 있다: 상대의 원래 코스트 5 이하인 캐릭터 1장까지를 KO한다.]],
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
        conditions={},
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
    rules_id=[[EB04-049]],
    schema_version=1,
  })
end
