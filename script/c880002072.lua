-- AUTO-GENERATED: P-114 / 롤로노아 조로
-- rules_id=P-114 script_id=880002072 fingerprint=48287b90cd028c1c422b4f13a9e7c482db6ba92046b4dc0ab57c71446f785117
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-114]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
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
            count=1,
            op=[[ACTIVE_DON_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 액티브 상태인 두웅!!이 있는 경우, 이 캐릭터를 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[P-114]],
    schema_version=1,
  })
end
