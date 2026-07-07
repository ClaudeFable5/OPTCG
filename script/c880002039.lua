-- AUTO-GENERATED: P-044 / 사보
-- rules_id=P-044 script_id=880002039 fingerprint=1252fa2eebda9d829ece1596018a5cce1fb6bc72b93b3a665b75c5030c5cf674
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-044]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
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
            count=4,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】자신의 패가 4장 이하인 경우, 이 캐릭터의 파워 +2000.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[P-044]],
    schema_version=1,
  })
end
