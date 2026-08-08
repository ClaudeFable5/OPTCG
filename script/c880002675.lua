-- MANUAL: OP16-118 / 포트거스 D. 에이스 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-118]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            amount=2000,
            op=[[MODIFY_COUNTER]],
            selector={
              filter={
                card_type=[[CHARACTER]],
                power_eq=8000,
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
              zone=[[HAND]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 패의 파워 8000인 캐릭터 카드 전부는 카운터 +2000이 된다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              any={
                { name=[[몽키 D. 루피]] },
                { trait=[[흰 수염 해적단]] },
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
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】/【KO 시】 자신의 덱 위에서 5장을 보고, 「몽키 D. 루피」나 『흰 수염 해적단』을 포함한 특징을 가진 카드 1장까지를 공개하고 패에 넣는다. 그 후, 나머지를 원하는 순서로 덱 아래에 놓는다.]],
        timings={
          [[ON_PLAY]],
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-118]],
    schema_version=1,
  })
end
