-- AUTO-GENERATED: OP14-094 / Mr.5(젬)
-- rules_id=OP14-094 script_id=880002259 fingerprint=3cf47598008e507576490a950866ee350c75eb52c5cc4c7cee70ce027a5f8ace
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-094]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            filter={
              any={
                {
                  cost_eq=0,
                },
                {
                  cost_gte=8,
                },
              },
            },
            op=[[CHARACTER_EXISTS]],
            player=[[ANY]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】코스트 0이나 8 이상인 캐릭터가 있는 경우, 카드를 2장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP14-094]],
    schema_version=1,
  })
end
