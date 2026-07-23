-- AUTO-GENERATED: OP14-059 / 나도 데려가줘!! 반드시 도움이 될 터!!!
-- rules_id=OP14-059 script_id=880002224 fingerprint=7bcd8580e832e969cc48427b55a03dee59fdc524c65b429381d899245732692a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-059]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            name=[[징베]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
          {
            count=2,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 리더가 「징베」이고, 패가 2장 이하인 경우, 카드를 2장 뽑는다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                cost_lte=4,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[코스트 4 이하인 캐릭터 1장까지를 주인의 패로 되돌린다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-059]],
    schema_version=1,
  })
end
