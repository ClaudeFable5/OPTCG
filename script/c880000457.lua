-- AUTO-GENERATED: OP03-091 / 헤르메포
-- rules_id=OP03-091 script_id=880000457 fingerprint=a13e32eaf6063a64b3aa09defc3ba3c692c36e4b81383c3f42539ad62dbd117b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-091]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[SET_COST]],
            selector={
              count=1,
              filter={
                vanilla=true,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            value=0,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】이번 턴 동안, 상대의 원래 효과가 없는 캐릭터를 1장까지 코스트 0으로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-091]],
    schema_version=1,
  })
end
