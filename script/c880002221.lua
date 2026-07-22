-- AUTO-GENERATED: OP14-056 / 와다츠미
-- rules_id=OP14-056 script_id=880002221 fingerprint=48247afeb517c4d0292c571869f63770178e1006cd5a93c3f77120840302d963
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-056]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_ATTACK]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 캐릭터는 어택할 수 없다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[NEGATE_EFFECTS]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[효과로 자신의 패가 버려졌을 때, 이 캐릭터는, 이번 턴 동안, 효과가 무효가 된다.]],
        timings={
          [[ON_HAND_DISCARDED_BY_TRAIT_EFFECT]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-056]],
    schema_version=1,
  })
end
