-- AUTO-GENERATED: OP01-087 / 오피서 에이전트
-- rules_id=OP01-087 script_id=880000210 fingerprint=da48f4fc9ddb76ef4f5e101c09e85d9b6fb6951d6fc9de22e22ed8629cbf9d42
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-087]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=3,
              trait=[[바로크 워크스]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】 자신의 패에서 코스트 3 이하인 《바로크 워크스》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[COUNTER]],
        },
      },
      {
        actions={
          {
            effect_timing=[[COUNTER]],
            op=[[ACTIVATE_CARD_EFFECT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드의 【카운터】 효과를 발동한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-087]],
    schema_version=1,
  })
end
