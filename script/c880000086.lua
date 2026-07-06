-- AUTO-GENERATED: EB02-025 / 돈키호테 로시난테
-- rules_id=EB02-025 script_id=880000086 fingerprint=ac200cda096d07640e4722ca28e75b23cd43c65c113bc82f8d828a90515f6d9d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-025]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            filter={
              card_type=[[CHARACTER]],
              cost_lte=2,
            },
            look_count=5,
            op=[[PLAY_FROM_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            rested=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={
          {
            name=[[돈키호테 로시난테]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=1,
            op=[[REST_DON]],
          },
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】자신의 두웅!! 1장과 이 캐릭터를 레스트할 수 있다: 자신의 리더가 「돈키호테 로시난테」인 경우, 자신의 덱 위에서 5장을 보고, 코스트 2 이하인 캐릭터 카드를 1장까지 레스트 상태로 등장시킨다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-025]],
    schema_version=1,
  })
end
