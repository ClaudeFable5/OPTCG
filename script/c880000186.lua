-- AUTO-GENERATED: OP01-063 / 아론
-- rules_id=OP01-063 script_id=880000186 fingerprint=5d9069304b1cfc2c0b96384a7b224a975d557e6e975c3892825709142bec52a9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-063]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[EXACT]],
            op=[[REVEAL_HAND]],
            player=[[OPPONENT]],
          },
          {
            actions={
              {
                count=1,
                destination=[[DECK_BOTTOM]],
                op=[[RETURN_LIFE_TO_DECK]],
                player=[[OPPONENT]],
                position=[[TOP]],
              },
            },
            conditions={
              {
                filter={
                  card_type=[[EVENT]],
                },
                op=[[LAST_TARGET_MATCHES]],
              },
            },
            op=[[IF]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【기동: 메인】이 캐릭터를 레스트할 수 있다: 상대의 패 1장을 선택해 공개한다. 공개한 카드가 이벤트인 경우, 상대의 라이프 위에서 1장까지를 주인의 덱 맨 아래로 되돌린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-063]],
    schema_version=1,
  })
end
