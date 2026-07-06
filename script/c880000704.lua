-- AUTO-GENERATED: OP05-091 / 레베카
-- rules_id=OP05-091 script_id=880000704 fingerprint=8476db9c6b9b1fc5e8a7a6ed87c8f3cc8c5b3c907b34e09230febf491790ef1b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-091]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            destination=[[HAND]],
            filter={
              card_type=[[CHARACTER]],
              color=[[BLACK]],
              cost_gte=3,
              cost_lte=7,
              name_neq=[[레베카]],
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              color=[[BLACK]],
              cost_lte=3,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=true,
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 트래시에서 「레베카」 이외의 코스트 3에서 7인 흑색 캐릭터 카드를 1장까지 패에 더한다. 그 후, 자신의 패에서 코스트 3 이하인 흑색 캐릭터 카드를 1장까지 레스트 상태로 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP05-091]],
    schema_version=1,
  })
end
