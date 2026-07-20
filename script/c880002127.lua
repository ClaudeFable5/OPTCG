-- AUTO-GENERATED: EB03-024 / 네펠타리 비비
-- rules_id=EB03-024 script_id=880002127 fingerprint=377456fbacdb8e45a11f237b22a8513a95d640f60fad91e1b821202de6b8b3fb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-024]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=5,
              trait_any={
                [[알라바스타 왕국]],
                [[밀짚모자 일당]],
              },
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
          {
            duration=[[THIS_TURN]],
            filter={
              card_type=[[CHARACTER]],
            },
            op=[[CANNOT_PLAY]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 코스트 5 이하인 《알라바스타 왕국》 또는 《밀짚모자 일당》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다. 그 후, 이번 턴 동안, 자신은 자신의 필드에 캐릭터 카드를 등장시킬 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB03-024]],
    schema_version=1,
  })
end
