-- AUTO-GENERATED: OP10-067 / 세뇨르 핑크
-- rules_id=OP10-067 script_id=880001282 fingerprint=3145558817df589d6d559104e5adb43d7be18d532b09bee2b27635ee13e8f952
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-067]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            destination=[[HAND]],
            filter={
              card_type=[[EVENT]],
              color=[[PURPLE]],
              cost_lte=5,
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
          {
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 자신의 트래시에서 코스트 5 이하인 자색 이벤트를 1장까지 패에 더한다. 그 후, 자신의 두웅!!을 1장까지 액티브로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-067]],
    schema_version=1,
  })
end
