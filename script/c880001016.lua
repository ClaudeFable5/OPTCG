-- AUTO-GENERATED: OP08-040 / 아트모스
-- rules_id=OP08-040 script_id=880001016 fingerprint=884415c7f7f05cefd3bc810e7e9fe9d25236d85bcabb2d7ef479da087b4e2ea9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-040]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                cost_lte=4,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_TRAIT_CONTAINS]],
            player=[[YOU]],
            trait=[[흰 수염 해적단]],
          },
        },
        costs={
          {
            count=2,
            filter={
              trait_contains=[[흰 수염 해적단]],
            },
            op=[[REVEAL_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 『흰 수염 해적단』을 포함한 특징을 가진 카드 2장을 공개할 수 있다: 자신의 리더가 『흰 수염 해적단』을 포함한 특징을 가진 경우, 상대의 코스트 4 이하인 캐릭터를 1장까지 주인의 패로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-040]],
    schema_version=1,
  })
end
