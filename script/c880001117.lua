-- AUTO-GENERATED: OP09-022 / 리무
-- rules_id=OP09-022 script_id=880001117 fingerprint=9fae9bc1f795948a3d4d29b7d96ca50a7fb649ba4bf510ed643aa54b9e66316d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-022]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[PLAY_OWN_CHARACTERS_RESTED]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 캐릭터 카드는 레스트 상태로 등장한다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
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
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=5,
              trait=[[ODYSSEY]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            count=3,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 두웅!! 3장을 레스트할 수 있다: 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가하고, 자신의 패에서 코스트 5 이하인 《ODYSSEY》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-022]],
    schema_version=1,
  })
end
