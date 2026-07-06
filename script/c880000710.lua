-- AUTO-GENERATED: OP05-097 / 성지 마리조아
-- rules_id=OP05-097 script_id=880000710 fingerprint=1b2e1017886b99591db45d17c121518d80a2dece7ad87cf73f8b98f94a9dc474
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-097]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-1,
            duration=[[WHILE_CONDITION]],
            filter={
              card_type=[[CHARACTER]],
              cost_gte=2,
              trait=[[천룡인]],
            },
            op=[[MODIFY_NEXT_PLAY_COST]],
            player=[[YOU]],
            uses_per_card=1,
            zone=[[HAND]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】자신이 패에서 등장시키는 코스트 2 이상인 《천룡인》 특징을 가진 캐릭터 카드의 지불 코스트는 1 적어진다.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-097]],
    schema_version=1,
  })
end
