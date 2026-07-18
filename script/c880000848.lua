-- AUTO-GENERATED: OP06-114 / 와이퍼
-- rules_id=OP06-114 script_id=880000848 fingerprint=86f29d16b836feb6030eec5de8d3da82c6e0f0c7eacd5b04b14d9c02963cf968
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-114]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              any={
                {
                  name=[[어퍼 야드]],
                },
                {
                  trait=[[샨도라의 전사]],
                },
              },
            },
            look_count=5,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            reveal=true,
            select_count=1,
            select_mode=[[UP_TO]],
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
              filter={
                card_type=[[STAGE]],
                cost_eq=1,
              },
              kind=[[STAGE]],
              mode=[[EXACT]],
              owner=[[ANY]],
              -- [수기 교정 2026-07-18] 원문 무소유지정("주인의 덱") - YOU→ANY (OP06-043 제보 패밀리)
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】코스트 1인 스테이지 1장을 주인의 덱 맨 아래로 되돌릴 수 있다: 자신의 덱 위에서 5장을 보고, 「어퍼 야드」 또는 《샨도라의 전사》 특징을 가진 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-114]],
    schema_version=1,
  })
end
