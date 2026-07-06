-- AUTO-GENERATED: OP13-014 / 포트거스 D. 루즈
-- rules_id=OP13-014 script_id=880001586 fingerprint=ff869e206991e0a13fa79d22ae1c6cff383710ea07f875707e4d5f708480e1f9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-014]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                name=[[포트거스 D. 에이스]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이번 턴 동안, 자신의 「포트거스 D. 에이스」 1장까지의 파워 +3000.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-014]],
    schema_version=1,
  })
end
