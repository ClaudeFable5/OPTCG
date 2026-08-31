-- MANUAL: ST31-005 / 사우전드 써니 호 (2026-08-28 6색 스타트덱 ST31~36 추가)
-- JP 공홈 series 550031 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST31-005]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              trait=[[밀짚모자 일당]],
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
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 5장을 보고, 특징 《밀짚모자 일당》을 가진 카드 1장까지를 공개하고 패에 넣는다. 그 후, 나머지를 원하는 순서로 덱 아래에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              filter={
                name=[[몽키 D. 루피]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【기동 메인】이 스테이지를 레스트로 할 수 있다：자신의 「몽키 D. 루피」 1장에 레스트 상태인 두웅!! 1장까지를 부여한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST31-005]],
    schema_version=1,
  })
end
