-- AUTO-GENERATED: EB04-054 / 바솔로뮤 쿠마
-- rules_id=EB04-054 script_id=880002475 fingerprint=8e347c80d5e7b52563d0b8097e52624a9fe652740f219619f01b401e75fdd712
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-054]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            count=2,
            op=[[LIFE_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 라이프가 2장 이하인 경우, 자신의 덱 위에서 1장까지를 라이프 맨 위에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[TAKE_LIFE_TO_HAND]],
            player=[[OPPONENT]],
            position=[[TOP]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】상대의 라이프 위에서 1장까지를 주인의 패에 넣는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-054]],
    schema_version=1,
  })
end
