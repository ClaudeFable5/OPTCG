-- AUTO-GENERATED: OP04-002 / 이가람
-- rules_id=OP04-002 script_id=880000492 fingerprint=94099667d8521cf16968f417eadbc83b1b8b7db5add15d2c44edde685f579e55
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              trait=[[알라바스타 왕국]],
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
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
          {
            amount=-5000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_OWN_POWER]],
            selector={
              count=1,
              filter={
                state=[[ACTIVE]],
              },
              kind=[[LEADER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 레스트하고 이번 턴 동안, 자신의 액티브 상태인 리더 1장의 파워를 -5000 할 수 있다: 자신의 덱 위에서 5장을 보고, 《알라바스타 왕국》 특징을 가진 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-002]],
    schema_version=1,
  })
end
