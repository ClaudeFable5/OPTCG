-- AUTO-GENERATED PROMO: P-082 / 크로커다일
-- rules_id=P-082 script_id=880002540
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-082]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_DECK_BOTTOM]],
            selector={
              count=1,
              filter={
                power_lte=2000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
          {
            op=[[LEADER_HAS_TRAIT_ANY]],
            player=[[YOU]],
            traits={
              [[크로스 길드]],
              [[바로크 워크스]],
              [[전 바로크 워크스]],
            },
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】【등장 시】자신의 리더가 《크로스 길드》 특징 또는 『바로크 워크스』를 포함한 특징을 가진 경우, 상대의 파워 2000 이하인 캐릭터를 1장까지 주인의 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[P-082]],
    schema_version=1,
  })
end
