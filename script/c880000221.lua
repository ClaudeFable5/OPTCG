-- AUTO-GENERATED: OP01-098 / 쿠로즈미 오로치
-- rules_id=OP01-098 script_id=880000221 fingerprint=e5e6a8d7860921bf9d165796c62c4c8085b46cd42c4ae5d40d3472c4efa48de6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-098]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            destination=[[HAND]],
            filter={
              name=[[인조 악마의 열매 SMILE]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_DECK]],
            player=[[YOU]],
            reveal=true,
          },
          {
            op=[[SHUFFLE_DECK]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱에서「인조 악마의 열매 SMILE」을 1장까지 공개하여 패에 더하고 덱을 섞는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-098]],
    schema_version=1,
  })
end
