-- AUTO-GENERATED: EB03-031 / 빈스모크 레이주
-- rules_id=EB03-031 script_id=880002134 fingerprint=469404fe7a55f44d46bca8094fe9b68fc9d54eb451e6926a53cc0a596666d03f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-031]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            effect_timing=[[MAIN]],
            filter={
              card_type=[[EVENT]],
              cost_lte=7,
            },
            mode=[[UP_TO]],
            op=[[ACTIVATE_CARD_EFFECT]],
            source=[[TRASH]],
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
          {
            name=[[상디]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】【등장 시】두웅!!-1: 자신의 리더가 「상디」인 경우, 자신의 트래시에 있는 코스트 7 이하인 이벤트 1장까지의 【메인】 효과를 발동한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-031]],
    schema_version=1,
  })
end
