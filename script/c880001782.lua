-- AUTO-GENERATED: ST04-017 / 오니가시마
-- rules_id=ST04-017 script_id=880001782 fingerprint=2595645885b029c913f3c09419f9fc10f4bf023c2b079bd004267b043643af3f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST04-017]],
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
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[백수 해적단]],
          },
        },
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】 이 스테이지를 레스트할 수 있다: 자신의 리더가 《백수 해적단》 특징을 가진 경우, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST04-017]],
    schema_version=1,
  })
end
