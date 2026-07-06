-- AUTO-GENERATED: OP10-040 / 약한 놈은, 어찌 죽을지도 택하지 못해
-- rules_id=OP10-040 script_id=880001255 fingerprint=7be328e07fc8332d63015660838554d407a796091baaf127d046db27f3cb87ad
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-040]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=7,
                state=[[RESTED]],
              },
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
        source_text=[[【메인】/【카운터】상대의 레스트 상태이고 코스트 7 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[MAIN]],
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-040]],
    schema_version=1,
  })
end
