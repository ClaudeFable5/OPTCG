-- AUTO-GENERATED: EB04-013 / 캐럿
-- rules_id=EB04-013 script_id=880002434 fingerprint=6dcc66d8d26ac16f8fda82b5b743e13762d0235247d85d51caba82ac6b894ab5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-013]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=2,
              filter={
                trait=[[밍크족]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[밍크족]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《밍크족》 특징을 가진 경우, 자신의 《밍크족》 특징을 가진 캐릭터 2장까지와 리더를 액티브로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-013]],
    schema_version=1,
  })
end
