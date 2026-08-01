-- AUTO-GENERATED PROMO: P-074 / 포트거스 D. 에이스
-- rules_id=P-074 script_id=880002502
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-074]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=5,
            destinations={
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
            op=[[LOOK_REORDER_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            op=[[RETURN_SELF_TO_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 주인의 패로 되돌릴 수 있다: 자신의 덱 위에서 5장을 보고, 원하는 순서대로 덱 맨 위나 아래로 되돌린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[P-074]],
    schema_version=1,
  })
end
