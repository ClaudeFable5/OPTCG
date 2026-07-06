-- AUTO-GENERATED: OP07-070 / 빅빵
-- rules_id=OP07-070 script_id=880000925 fingerprint=0e84b13ae803f2a00b06a5863a9fe1d24a3310dc3a8a2f50134c94413d8edf19
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-070]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              cost_lte=4,
              trait=[[폭시 해적단]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            op=[[FIELD_DON_LTE_OPPONENT]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신 필드의 두웅!!이 상대 필드의 두웅!! 수 이하인 경우, 자신의 패에서 코스트 4 이하인 《폭시 해적단》 특징을 가진 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-070]],
    schema_version=1,
  })
end
