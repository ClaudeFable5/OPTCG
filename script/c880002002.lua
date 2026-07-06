-- AUTO-GENERATED: ST28-003 / 킨에몬
-- rules_id=ST28-003 script_id=880002002 fingerprint=a34aebd24eb29a589d4a3dffdfa012327f51e0a2aa8368a9a6174eddcd55c938
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST28-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[와노쿠니]],
          },
          {
            count=3,
            op=[[LIFE_LTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 《와노쿠니》 특징을 가지고, 상대의 라이프가 3장 이하인 경우, 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST28-003]],
    schema_version=1,
  })
end
