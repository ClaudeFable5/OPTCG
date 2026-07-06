-- AUTO-GENERATED: ST12-016 / 사자의 노래
-- rules_id=ST12-016 script_id=880001898 fingerprint=52a16ea86f5970c8b63ccb7b1d17ae5fb72920ccd8e1a9d13e7077885745f68c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST12-016]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                character_cost_lte=4,
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】/【카운터】상대의 리더 또는 코스트 4 이하인 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[MAIN]],
          [[COUNTER]],
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
        source_text=[[이 카드의 【메인】효과를 발동한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST12-016]],
    schema_version=1,
  })
end
