-- AUTO-GENERATED: OP04-015 / 롤로노아 조로
-- rules_id=OP04-015 script_id=880000505 fingerprint=bcc52492a08f4ef63397d960dda935f48dca810d9e96946fe35160511c8f6e68
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-015]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2000,
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
        source_text=[[【등장 시】이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -2000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-015]],
    schema_version=1,
  })
end
