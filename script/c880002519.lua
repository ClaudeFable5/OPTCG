-- AUTO-GENERATED PROMO: P-103 / 포트거스 D. 에이스
-- rules_id=P-103 script_id=880002519
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-103]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={},
        conditions={
          {
            count=99,
            op=[[CHARACTER_COUNT_GTE]],
            player=[[YOU]],
            reason=[[DRAW_THEN_PLACE_HAND_TOP_OR_BOTTOM]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】카드를 2장 뽑고, 자신의 패 2장을 원하는 순서대로 바꿔 넣고, 덱 위나 아래에 놓는다. 그 후, 자신의 리더에게 레스트 상태인 두웅!! 1장까지를 부여한다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[P-103]],
    schema_version=1,
  })
end
