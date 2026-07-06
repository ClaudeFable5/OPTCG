-- AUTO-GENERATED: OP10-030 / 스모커
-- rules_id=OP10-030 script_id=880001245 fingerprint=9ddbcc8ae9d0549bb5eb5323a661bca36ff63bccffce8485b234c3ca20c8165e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-030]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
          {
            duration=[[THIS_TURN]],
            op=[[CANNOT_SET_DON_ACTIVE]],
            player=[[YOU]],
            source=[[CHARACTER_EFFECT]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【기동: 메인】자신의 두웅!!을 1장까지 액티브로 한다. 그 후, 이번 턴 동안, 자신은 캐릭터의 효과로 두웅!!을 액티브로 할 수 없다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={
      [[BANISH]],
    },
    rules_id=[[OP10-030]],
    schema_version=1,
  })
end
