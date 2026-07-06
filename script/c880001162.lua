-- AUTO-GENERATED: OP09-066 / 잠발
-- rules_id=OP09-066 script_id=880001162 fingerprint=5dae6227ff067d4ad6a52a68661e81bbbd32a949e5eda8c278f8a2da831ea65b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-066]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=3,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
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
        source_text=[[【등장 시】상대 필드의 두웅!! 수가 자신 필드의 두웅!! 수보다 많을 경우, 상대의 코스트 3 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-066]],
    schema_version=1,
  })
end
