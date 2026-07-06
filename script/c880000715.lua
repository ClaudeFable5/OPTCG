-- AUTO-GENERATED: OP05-102 / 게다츠
-- rules_id=OP05-102 script_id=880000715 fingerprint=afcf9e2c7ee4aa712e76a379c49a75573e958bffa09def9bc4f5b9760b91663e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-102]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte_life_of=[[OPPONENT]],
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
        source_text=[[【등장 시】상대의 라이프 수 이하의 코스트를 가진 상대의 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-102]],
    schema_version=1,
  })
end
