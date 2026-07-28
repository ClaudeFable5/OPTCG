-- AUTO-GENERATED: OP15-080 / 오즈
-- rules_id=OP15-080 script_id=880002382 fingerprint=de93fcbd6b4090c22aa6bd911c4b33391f4688ce6c010f0c9d5b8a894d7c468a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-080]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=7000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            filter={
              name=[[겟코 모리아]],
              power_gte=10000,
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
          {
            name=[[오즈]],
            op=[[OTHER_CHARACTER_NAME_ABSENT]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 필드에 파워 10000 이상인 「겟코 모리아」가 있고, 다른 「오즈」가 없는 경우, 이 캐릭터의 파워 +7000.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            count=3,
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 트래시에서 카드 3장을 원하는 순서대로 덱 맨 아래에 놓을 수 있다: 이 캐릭터 카드를 트래시에서 등장시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-080]],
    schema_version=1,
  })
end
