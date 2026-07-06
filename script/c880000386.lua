-- AUTO-GENERATED: OP03-020 / 스트라이커
-- rules_id=OP03-020 script_id=880000386 fingerprint=ce681772751f7757472acd6113940af37a7e568be0c4fa507405d5114fce58de
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-020]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              card_type=[[EVENT]],
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
        conditions={
          {
            name=[[포트거스 D. 에이스]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=2,
            op=[[REST_DON]],
          },
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】2(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다), 이 스테이지를 레스트할 수 있다: 자신의 리더가 「포트거스 D. 에이스」인 경우, 자신의 덱 위에서 5장을 보고, 이벤트를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-020]],
    schema_version=1,
  })
end
