-- AUTO-GENERATED: OP13-033 / 프랑키
-- rules_id=OP13-033 script_id=880001605 fingerprint=198cbed588b3e589efda512633e12efc04ac77a3c398b40e2d120ee879798aee
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-033]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            card_selector={
              count=2,
              kind=[[FIELD_CARD]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            count=2,
            mode=[[UP_TO]],
            op=[[REST_CARD_OR_DON]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】상대의 카드를 2장까지 레스트로 한다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-033]],
    schema_version=1,
  })
end
