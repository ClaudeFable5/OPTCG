-- AUTO-GENERATED: OP07-048 / 돈키호테 도플라밍고
-- rules_id=OP07-048 script_id=880000903 fingerprint=34fb4a8eaa9f42ee2f9f7b657de1fb1052fd4065b8e0a7d6a18a462120584152
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-048]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              trait=[[왕의 부하 칠무해]],
            },
            look_count=1,
            op=[[PLAY_FROM_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[KEEP]],
            rested=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={
          {
            count=2,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】2(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다): 자신의 덱 맨 위를 공개하고, 그 카드가 코스트 4 이하인 《왕의 부하 칠무해》 특징을 가진 캐릭터 카드인 경우, 레스트 상태로 등장시킬 수 있다. 그 후, 남은 카드를 덱 맨 아래로 되돌린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-048]],
    schema_version=1,
  })
end
