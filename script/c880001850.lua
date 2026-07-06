-- AUTO-GENERATED: ST09-002 / 우즈키 텐푸라
-- rules_id=ST09-002 script_id=880001850 fingerprint=1866018214ea6ab0e87cc9afeb23a0c2419acfd4ef20762ee0b4e5a7c5ab15ea
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST09-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=2,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            op=[[ADD_SELF_TO_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[상대의 코스트 2 이하인 캐릭터를 1장까지 레스트로 하고, 이 카드를 패에 더한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST09-002]],
    schema_version=1,
  })
end
