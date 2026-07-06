-- AUTO-GENERATED: OP09-001 / 샹크스
-- rules_id=OP09-001 script_id=880001096 fingerprint=98c84848e54412f0b26656b57414b793fbda5a45d4605fac65e5400576e2a170
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-001]],
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
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【턴 1회】상대가 어택했을 때, 발동할 수 있다. 이번 턴 동안, 상대의 리더 또는 캐릭터 1장까지의 파워 -1000.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-001]],
    schema_version=1,
  })
end
