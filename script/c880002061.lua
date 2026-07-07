-- AUTO-GENERATED: P-078 / 아디오
-- rules_id=P-078 script_id=880002061 fingerprint=c3a28ea1579ba4754c77aa49aea2b4b8ec55c0e5f71d506b95fe98471765ccec
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-078]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
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
            count=2,
            filter={
              trait=[[ODYSSEY]],
            },
            op=[[CHARACTER_COUNT_GTE]],
            player=[[YOU]],
            state=[[RESTED]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 레스트 상태인 《ODYSSEY》 특징을 가진 캐릭터가 2장 이상 있는 경우, 이 캐릭터의 파워 +1000.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[P-078]],
    schema_version=1,
  })
end
