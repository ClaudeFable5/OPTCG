-- AUTO-GENERATED: OP15-007 / 깅
-- rules_id=OP15-007 script_id=880002309 fingerprint=bc3e97806c8e9c79a2e16c3c9caccb58d824ef2ca0c3921a92ab698337d29e9f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-007]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=5,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[이스트 블루]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《이스트 블루》 특징을 가진 경우, 자신의 패에서 코스트 5 이하인 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-007]],
    schema_version=1,
  })
end
