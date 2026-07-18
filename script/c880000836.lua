-- AUTO-GENERATED: OP06-102 / 카마키리
-- rules_id=OP06-102 script_id=880000836 fingerprint=cd4ecfb56cd0dc57903a02b2dea71ae411372a0ad0eb7f98b55070c1e785d6f5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-102]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=2,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
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
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】코스트 1인 스테이지 1장을 주인의 덱 맨 아래로 되돌릴 수 있다: 상대의 코스트 2 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={
          {
            count=2,
            op=[[LIFE_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 라이프가 2장 이하인 경우, 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-102]],
    schema_version=1,
  })
end
