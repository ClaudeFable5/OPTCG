-- AUTO-GENERATED: OP14-024 / 킨에몬
-- rules_id=OP14-024 script_id=880002189 fingerprint=8cc7d3e4339d7441954ba9bb4ead81b6b475cde46317202507c328d11946f93e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-024]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=3,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
          {
            duration=[[THIS_TURN]],
            filter={
              card_type=[[CHARACTER]],
            },
            op=[[CANNOT_PLAY]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 두웅!! 3장까지를 액티브로 한다. 그 후, 자신은, 이번 턴 동안, 캐릭터 카드를 등장시킬 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            op=[[REST]],
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
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】상대의 카드 1장까지를 레스트로 한다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-024]],
    schema_version=1,
  })
end
