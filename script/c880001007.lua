-- AUTO-GENERATED: OP08-031 / 미야기
-- rules_id=OP08-031 script_id=880001007 fingerprint=9c4eef7340b6ed1bd122b3b042fc988b2185675d7297ac95b5310767e590786a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-031]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                cost_lte=2,
                trait=[[밍크족]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 코스트 2 이하인 《밍크족》 특징을 가진 캐릭터를 1장까지 액티브로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-031]],
    schema_version=1,
  })
end
