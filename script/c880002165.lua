-- AUTO-GENERATED: EB03-062 / 트라팔가 로
-- rules_id=EB03-062 script_id=880002165 fingerprint=39060967267d7a256c32f5a1857e49e5ed8af4373ecba01a337108eda6c516c9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-062]],
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
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=7,
              name=[[트라팔가 로]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】자신의 패 1장을 버리고, 이 캐릭터를 트래시에 놓을 수 있다: 자신의 덱 위에서 1장까지를 라이프 맨 위에 더한다. 그 후, 자신의 패에서 코스트 7 이하인 「트라팔가 로」를 1장까지 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={
      [[RUSH]],
    },
    rules_id=[[EB03-062]],
    schema_version=1,
  })
end
