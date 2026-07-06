-- AUTO-GENERATED: OP13-069 / 톰
-- rules_id=OP13-069 script_id=880001641 fingerprint=de99f594fe52227d7fc1acd0cc5412636d2e319b99bb97a46efbe64bb7f5982c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-069]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            destination=[[HAND]],
            filter={
              card_type=[[STAGE]],
              cost_lte=3,
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!!-1: 자신의 트래시에서 코스트 3 이하인 스테이지 카드를 1장까지 패에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-069]],
    schema_version=1,
  })
end
