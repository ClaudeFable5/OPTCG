-- AUTO-GENERATED: ST10-012 / 베포
-- rules_id=ST10-012 script_id=880001872 fingerprint=6a563492d5ea93cc377d89f67e9e56cb2e8909ff9fc56f20b25d5cd8ddad4e81
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST10-012]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
        },
        conditions={
          {
            op=[[FIELD_DON_LT_OPPONENT]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】/【어택 시】상대 필드의 두웅!! 수가 자신 필드의 두웅!! 수보다 많을 경우, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[ON_PLAY]],
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST10-012]],
    schema_version=1,
  })
end
