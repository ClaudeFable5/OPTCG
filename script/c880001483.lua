-- AUTO-GENERATED: OP12-030 / 쥬라큘 미호크
-- rules_id=OP12-030 script_id=880001483 fingerprint=95e404cd6ac62f621c743ff1da983fa96770e1d75a1612f20ca307f3aeb62d91
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-030]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=4,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
          {
            duration=[[THIS_TURN]],
            filter={
              base_cost_gte=7,
              card_type=[[CHARACTER]],
            },
            op=[[CANNOT_PLAY]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 두웅!!을 4장까지 액티브로 한다. 그 후, 이번 턴 동안, 자신은 원래 코스트가 7 이상인 캐릭터 카드를 등장시킬 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP12-030]],
    schema_version=1,
  })
end
