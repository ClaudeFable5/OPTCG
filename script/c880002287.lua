-- AUTO-GENERATED: ST29-002 / 우솝
-- rules_id=ST29-002 script_id=880002287 fingerprint=e3fa782812b2a494986094961b9d35dfb21b0332023c4f04ffc61083af4e3213
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST29-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte_life_of=[[OPPONENT]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】/【어택 시】상대의 라이프 매수 이하의 코스트를 가진 상대 캐릭터 1장까지를 레스트로 한다.]],
        timings={
          [[ON_PLAY]],
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST29-002]],
    schema_version=1,
  })
end
