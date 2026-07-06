-- AUTO-GENERATED: OP01-056 / 항마의 상
-- rules_id=OP01-056 script_id=880000179 fingerprint=a43617c5f5585845efb8259b28ec8a06a4388e19d4805c7dac05cba548981721
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-056]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=2,
              filter={
                cost_lte=5,
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
        source_text=[[【메인】 상대의 레스트 상태이고 코스트 5 이하인 캐릭터를 2장까지 KO시킨다.]],
        timings={
          [[MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-056]],
    schema_version=1,
  })
end
