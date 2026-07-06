-- AUTO-GENERATED: OP04-112 / 야마토
-- rules_id=OP04-112 script_id=880000604 fingerprint=308f5b51c9f077b731447399796b4aefd81c3f9dca17095eb2b4a6a8de88712d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-112]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte_life_total=true,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
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
                count=1,
                op=[[LIFE_LTE]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】서로의 라이프 합계 이하의 코스트를 가진 상대의 캐릭터를 1장까지 KO 시킨다. 그 후, 자신의 라이프가 1장 이하인 경우, 자신의 덱 위에서 1장까지를 라이프 맨 위에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-112]],
    schema_version=1,
  })
end
