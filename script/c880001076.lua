-- AUTO-GENERATED: OP08-100 / 사우스 버드
-- rules_id=OP08-100 script_id=880001076 fingerprint=326cc9a1a5bbdc27cac0d39e2bd8bf6374ac166dc82da1054a5f4a98bf584253
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-100]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            filter={
              name=[[어퍼 야드]],
            },
            look_count=7,
            op=[[PLAY_FROM_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            rested=false,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 7장을 보고, 「어퍼 야드」를 1장까지 등장시킨다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-100]],
    schema_version=1,
  })
end
