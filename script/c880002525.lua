-- AUTO-GENERATED PROMO: P-112 / 나미
-- rules_id=P-112 script_id=880002525
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-112]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=2,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            name=[[나미]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 「나미」인 경우, 자신의 리더에게 레스트 상태인 두웅!! 1장까지를 부여한다. 그 후, 자신의 패에서 코스트 2 이하인 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[P-112]],
    schema_version=1,
  })
end
