-- AUTO-GENERATED: EB03-034 / 샬롯 링링
-- rules_id=EB03-034 script_id=880002137 fingerprint=daf085c51ee0fc52a690a0fb3b8bd92f2d5177d45aa29fad6321098e17a3c145
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-034]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            destination=[[DECK_TOP]],
            filter={},
            op=[[RETURN_HAND_TO_DECK]],
            player=[[YOU]],
          },
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[ACTIVE]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】카드를 1장 뽑고, 자신의 패 1장을 덱 맨 위로 되돌린다. 그 후, 두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[ON_PLAY]],
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
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】두웅!!-1: 자신의 덱 위에서 1장까지를 라이프 맨 위에 더한다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-034]],
    schema_version=1,
  })
end
