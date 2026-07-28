-- AUTO-GENERATED: EB04-046 / 돌
-- rules_id=EB04-046 script_id=880002467 fingerprint=3e1a3d6523eaea53aaabdbb90e91bc4b6ed7d3bd8b7605add5c99dc3d42bd404
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-046]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_COST]],
            selector={
              count=0,
              filter={
                trait=[[해군]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】자신의 《해군》 특징을 가진 모든 캐릭터의 코스트 +2.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB04-046]],
    schema_version=1,
  })
end
