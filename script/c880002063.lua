-- AUTO-GENERATED: P-086 / 트라팔가 로
-- rules_id=P-086 script_id=880002063 fingerprint=2f62bb120c48ca18b022cde58a0c083534b40b62c1b9b5d7247e0ec53a2ec514
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-086]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              trait=[[하트 해적단]],
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
            count=1,
            op=[[RETURN_OWN_CARD_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
            selector={
              count=1,
              filter={},
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】두웅!!-3, 자신의 파워 3000 이상인 캐릭터 1장을 덱 맨 아래로 되돌릴 수 있다: 자신의 패에서 코스트 4 이하인 《하트 해적단》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[P-086]],
    schema_version=1,
  })
end
