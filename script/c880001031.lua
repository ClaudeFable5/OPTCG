-- AUTO-GENERATED: OP08-055 / 봉황인
-- rules_id=OP08-055 script_id=880001031 fingerprint=b41279e3bfc764cc840e8a768291b8d73e06b49e63ffd4bada80fa60de13eff2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-055]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_DECK_BOTTOM]],
            selector={
              count=1,
              filter={
                cost_lte=6,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
          },
        },
        conditions={},
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
        source_text=[[【메인】자신의 패에서 『흰 수염 해적단』을 포함한 특징을 가진 카드 2장을 공개할 수 있다: 코스트 6 이하인 캐릭터를 1장까지 주인의 덱 맨 아래로 되돌린다.]],
        timings={
          [[MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-055]],
    schema_version=1,
  })
end
