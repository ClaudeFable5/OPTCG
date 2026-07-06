-- AUTO-GENERATED: OP06-048 / 제프
-- rules_id=OP06-048 script_id=880000782 fingerprint=a33d5b5a9f3cad068e7a2d745fc0d0ae5b8548c182769724415e0c7d2c12f3f9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-048]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=4,
            mode=[[OPTIONAL]],
            op=[[MILL_DECK]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[이스트 블루]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】상대가 【블로커】 또는 이벤트를 발동했을 때, 자신의 리더가 《이스트 블루》 특징을 가진 경우, 자신의 덱 위에서 4장을 트래시에 놓을 수 있다.]],
        timings={
          [[ON_OPPONENT_BLOCKER_OR_EVENT_ACTIVATED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-048]],
    schema_version=1,
  })
end
