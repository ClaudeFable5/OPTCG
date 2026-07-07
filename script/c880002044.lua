-- AUTO-GENERATED: P-050 / 상디
-- rules_id=P-050 script_id=880002044 fingerprint=538ad2e8548663428a805531a25ca03cf82569550d67119bd1eef0d27e19d08b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-050]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=4000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=3,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【자신의 턴 동안】자신의 패가 3장 이하인 경우, 이 캐릭터의 파워 +4000.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[P-050]],
    schema_version=1,
  })
end
