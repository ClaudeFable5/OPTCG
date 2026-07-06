-- AUTO-GENERATED: OP10-036 / 페로나
-- rules_id=OP10-036 script_id=880001251 fingerprint=bbdb36c4474691a3aefd502914fa9f6d3725555fd73fe01e5dc196b8452e6944
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-036]],
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
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【자신의 턴 동안】【턴 1회】캐릭터가 자신의 효과로 레스트 되었을 때, 자신의 두웅!!을 1장까지 액티브로 한다.]],
        timings={
          [[ON_OWN_CHARACTER_RESTED_BY_EFFECT]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-036]],
    schema_version=1,
  })
end
