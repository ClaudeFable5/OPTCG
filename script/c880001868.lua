-- AUTO-GENERATED: ST10-008 / 샤치 & 펭귄
-- rules_id=ST10-008 script_id=880001868 fingerprint=966126b64046cebddce8608d40701ae5f13c03f9ed66491cb7198c39ddade4cf
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST10-008]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
        },
        conditions={
          {
            count=3,
            op=[[FIELD_DON_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신 필드의 두웅!!이 3장 이하인 경우, 두웅!! 덱에서 두웅!!을 2장까지 레스트 상태로 추가한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST10-008]],
    schema_version=1,
  })
end
