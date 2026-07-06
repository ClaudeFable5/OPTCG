-- AUTO-GENERATED: OP11-076 / 한냐발
-- rules_id=OP11-076 script_id=880001410 fingerprint=1365d04136f62af8173853eb86459f8f3eaec906023add9c2d184357222d8392
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-076]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=3,
              trait=[[임펠 다운]],
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
            trait=[[임펠 다운]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《임펠 다운》 특징을 가진 경우, 자신의 패에서 코스트 3 이하인 《임펠 다운》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP11-076]],
    schema_version=1,
  })
end
