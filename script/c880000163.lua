-- AUTO-GENERATED: OP01-040 / 킨에몬
-- rules_id=OP01-040 script_id=880000163 fingerprint=9f329cbc453e3b41f8cf52e30ec7b5351db5cc033e74f02c8a8c0b49ac4047a0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-040]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=3,
              trait=[[아카자야 9남자]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            name=[[코즈키 오뎅]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 「코즈키 오뎅」인 경우, 자신의 패에서 코스트 3 이하인 《아카자야 9남자》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                cost_lte=3,
                trait=[[아카자야 9남자]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【두웅!!×1】【어택 시】【턴 1회】자신의 코스트 3 이하인 《아카자야 9남자》 특징을 가진 캐릭터를 1장까지 액티브로 한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-040]],
    schema_version=1,
  })
end
