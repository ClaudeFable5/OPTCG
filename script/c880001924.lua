-- AUTO-GENERATED: ST14-006 / 나미
-- rules_id=ST14-006 script_id=880001924 fingerprint=c71c653cd4fdb89be3f8b5d0ec4d359e80a82bd2a8e8193c9b0cab2e2a984f23
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST14-006]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            actions={
              {
                count=1,
                op=[[DRAW]],
                player=[[YOU]],
              },
            },
            conditions={
              {
                filter={
                  cost_gte=8,
                },
                op=[[CHARACTER_EXISTS]],
                player=[[YOU]],
              },
              {
                count=6,
                op=[[HAND_LTE]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 코스트 8 이상인 캐릭터가 있고, 자신의 패가 6장 이하인 경우, 카드를 1장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST14-006]],
    schema_version=1,
  })
end
