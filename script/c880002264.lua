-- AUTO-GENERATED: OP14-099 / 불복이냐?
-- rules_id=OP14-099 script_id=880002264 fingerprint=accf6725ff3a2feafc70f317edbdccc4d3ab3ad41b3c5aac095c08ceabb77a4b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-099]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              name_neq=[[불복이냐?]],
              trait_contains=[[바로크 워크스]],
            },
            look_count=3,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[TRASH]],
            reveal=true,
            select_count=1,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 덱 위에서 3장을 보고, 「불복이냐?」 이외의 『바로크 워크스』를 포함한 특징을 가진 카드 1장까지를 공개하고 패에 더한다. 그 후, 남은 카드를 트래시에 놓는다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            op=[[ACTIVATE_CARD_EFFECT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드의 【메인】 효과를 발동한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-099]],
    schema_version=1,
  })
end
