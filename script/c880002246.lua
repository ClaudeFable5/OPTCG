-- AUTO-GENERATED: OP14-081 / 스파이더 마우스
-- rules_id=OP14-081 script_id=880002246 fingerprint=3ff71a88522b5896c893bc5731f8d79011f8b2af28bbec7cd9bce4970d63e59d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-081]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=3,
            op=[[MILL_DECK]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 3장을 트래시에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                base_cost_eq=1,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】상대의 원래 코스트가 1인 캐릭터 1장까지를 KO 시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-081]],
    schema_version=1,
  })
end
