-- AUTO-GENERATED: OP12-028 / 코즈키 히요리
-- rules_id=OP12-028 script_id=880001481 fingerprint=d522e576ccd6c5cc12df99aabbe21d3b02bcc4481deb21729c6e54a17a67654e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-028]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              any={
                {
                  attribute=[[SLASH]],
                },
                {
                  card_type=[[EVENT]],
                  color=[[GREEN]],
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
        conditions={
          {
            name=[[롤로노아 조로]],
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
        source_text=[[【기동: 메인】자신의 두웅!! 1장과 이 캐릭터를 레스트할 수 있다: 자신의 리더가 「롤로노아 조로」인 경우, 자신의 덱 위에서 5장을 보고, <참격> 속성을 가진 카드 또는 녹색 이벤트를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-028]],
    schema_version=1,
  })
end
