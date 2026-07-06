-- AUTO-GENERATED: EB01-054 / 간 폴
-- rules_id=EB01-054 script_id=880000053 fingerprint=7db311c855dc80a9bb16460ebedce9d7028da3d1ae18a1d09f3eed29a931f2ef
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-054]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=3,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            count=1,
            op=[[LIFE_LTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 라이프가 1장 이하인 경우, 상대의 코스트 3 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB01-054]],
    schema_version=1,
  })
end
