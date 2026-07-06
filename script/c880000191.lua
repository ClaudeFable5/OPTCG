-- AUTO-GENERATED: OP01-068 / 겟코 모리아
-- rules_id=OP01-068 script_id=880000191 fingerprint=a8921165a55ca1fcc8baa850e6dd5d901434ba6af708bfa0b2eedc53f7ca31d7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-068]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            keyword=[[DOUBLE_ATTACK]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=5,
            op=[[HAND_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】자신의 패가 5장 이상인 경우, 이 캐릭터는, 【더블 어택】을 얻는다.
(이 카드가 주는 대미지는 2가 된다)]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-068]],
    schema_version=1,
  })
end
