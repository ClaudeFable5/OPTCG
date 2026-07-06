-- AUTO-GENERATED: ST14-003 / 상디
-- rules_id=ST14-003 script_id=880001921 fingerprint=981a18bc293008019cabdadadf070c680a42d2b9f2b472ee50e7454d5dfc8064
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST14-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=5,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            filter={
              cost_gte=6,
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 코스트 6 이상인 캐릭터가 있을 경우, 상대의 코스트 5 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST14-003]],
    schema_version=1,
  })
end
