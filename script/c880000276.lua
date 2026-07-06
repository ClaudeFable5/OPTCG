-- AUTO-GENERATED: OP02-032 / 시실리안
-- rules_id=OP02-032 script_id=880000276 fingerprint=55fe3a7c467cdca86b59e341b8bba85fd564dc95bbf768889cefb56eed64de47
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-032]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                cost_lte=5,
                trait=[[밍크족]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=2,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】2(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다): 자신의 코스트 5 이하인 《밍크족》 특징을 가진 캐릭터를 1장까지 액티브로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-032]],
    schema_version=1,
  })
end
