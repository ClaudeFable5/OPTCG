-- MANUAL: OP16-059 / 화끈뻑적 대작전으로 변경이다아~~~!!! (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-059]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            filter={
              card_type=[[CHARACTER]],
              power_lte=6000,
              trait=[[임펠 다운]],
            },
            look_count=5,
            op=[[PLAY_FROM_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            select_count=2,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={
          {
            count=7,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】 자신의 두웅!! 7장을 레스트로 할 수 있다：자신의 덱 위에서 5장을 보고, 파워 6000 이하인 특징 《임펠 다운》을 가진 캐릭터 카드 2장까지를 등장시킨다. 그 후, 나머지를 원하는 순서로 덱 아래에 놓는다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【카운터】 자신의 리더를 이번 배틀 동안 파워 +3000.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-059]],
    schema_version=1,
  })
end
