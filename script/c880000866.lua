-- AUTO-GENERATED: OP07-013 / 마스크드 듀스
-- rules_id=OP07-013 script_id=880000866 fingerprint=477334646284b01d5c55faa7c0b2adf2a52869822f70a79416b0b4a5901bd999
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-013]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              any={
                {
                  name=[[포트거스 D. 에이스]],
                },
                {
                  card_type=[[EVENT]],
                  color=[[RED]],
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
            name=[[포트거스 D. 에이스]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 「포트거스 D. 에이스」인 경우, 자신의 덱 위에서 5장을 보고 「포트거스 D. 에이스」 또는 적색 이벤트를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-013]],
    schema_version=1,
  })
end
