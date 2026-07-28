-- AUTO-GENERATED: ST29-005 / 징베
-- rules_id=ST29-005 script_id=880002290 fingerprint=d764484da71d28c16972137c325515c49bd2f58ea3915d75882dca30d131fd5a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST29-005]],
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
            name=[[몽키 D. 루피]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】자신의 리더가 「몽키 D. 루피」인 경우, 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST29-005]],
    schema_version=1,
  })
end
