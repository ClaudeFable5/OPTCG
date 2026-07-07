-- AUTO-GENERATED: P-020 / 헤르메포
-- rules_id=P-020 script_id=880002024 fingerprint=815c4ceb0825979f2e43d48688793a9b04290f6d620a69a96f9620d7e7fb747b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-020]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】이번 턴 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +1000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[P-020]],
    schema_version=1,
  })
end
