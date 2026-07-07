-- AUTO-GENERATED: P-077 / 울티
-- rules_id=P-077 script_id=880002060 fingerprint=95c37aedf66f6f957b011dda9da049eb0e9252ac5573acda1794f5b5092f575e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-077]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            player=[[YOU]],
            state=[[RESTED]],
          },
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                color=[[PURPLE]],
              },
              kind=[[STAGE]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            ["then"]=true,
          },
        },
        conditions={
          {
            count=2,
            op=[[EVENT_COUNT_GTE]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【턴 1회】자신 필드의 두웅!!이 2장 이상 두웅!! 덱으로 되돌아갔을 때, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다. 그 후, 자신의 자색인 스테이지를 1장까지 액티브로 한다.]],
        timings={
          [[ON_DON_RETURNED]],
        },
      },
    },
    keywords={},
    rules_id=[[P-077]],
    schema_version=1,
  })
end
