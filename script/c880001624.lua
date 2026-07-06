-- AUTO-GENERATED: OP13-052 / 보아 마리골드
-- rules_id=OP13-052 script_id=880001624 fingerprint=6aaa4c225b5faa5a57677455f0d42ab09823d9c3050ca3628f7e9e44979bee1a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-052]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              cost_lte=6,
              name=[[보아 행콕]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            name=[[보아 행콕]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 「보아 행콕」인 경우, 자신의 패에서 코스트 6 이하인 「보아 행콕」을 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP13-052]],
    schema_version=1,
  })
end
