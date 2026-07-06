-- AUTO-GENERATED: OP01-011 / 고든
-- rules_id=OP01-011 script_id=880000134 fingerprint=69cdbff83ffa9c908edca9cd61ac39f2c0f063215a6886caf167bff0b4d9110b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-011]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={},
            op=[[RETURN_HAND_TO_DECK]],
            order=[[CHOOSE]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】 자신의 패 1장을 덱 맨 아래로 되돌릴 수 있다: 카드를 1장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-011]],
    schema_version=1,
  })
end
