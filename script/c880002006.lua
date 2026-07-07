-- AUTO-GENERATED: P-002 / 모험 냄새가 나!!!
-- rules_id=P-002 script_id=880002006 fingerprint=02042e49dc3bc61aad0cd4410b995483932cdeecec75bf03a1f8a83921655882
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            draw_same_count=true,
            op=[[REDRAW_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 패를 전부 덱 맨 아래로 되돌리고 덱을 섞는다. 그 후, 덱에 되돌린 수만큼 카드를 뽑는다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            effect_timing=[[MAIN]],
            op=[[ACTIVATE_CARD_EFFECT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드의 【메인】 효과를 발동한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[P-002]],
    schema_version=1,
  })
end
