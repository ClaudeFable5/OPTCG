-- AUTO-GENERATED: OP14-015 / 롤로노아 조로
-- rules_id=OP14-015 script_id=880002180 fingerprint=0bb4ef02776d8ede1eb6aa201cfa0234fc06e0e00e6f12c69d29b6200db2370f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-015]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -1000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={
      [[RUSH]],
    },
    rules_id=[[OP14-015]],
    schema_version=1,
  })
end
