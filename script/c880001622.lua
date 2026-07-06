-- AUTO-GENERATED: OP13-050 / 보아 썬더소니아
-- rules_id=OP13-050 script_id=880001622 fingerprint=6076fd6b380da5168b55a17273f8878a78587f8044c05ef157ded09c1806b327
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-050]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              cost_lte=3,
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
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 「보아 행콕」인 경우, 자신의 패에서 코스트 3 이하인 「보아 행콕」을 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-050]],
    schema_version=1,
  })
end
