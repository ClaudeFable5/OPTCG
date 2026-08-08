-- MANUAL: OP16-019 / 우리 힘을 보여줘라!!! (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-019]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=2,
            filter={
              card_type=[[CHARACTER]],
              power_eq=8000,
              trait=[[흰 수염 해적단]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】 자신의 패에서 파워 8000인 『흰 수염 해적단』을 포함한 특징을 가진 캐릭터 카드 2장까지를 등장시킨다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_TURN]],
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
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】 자신의 리더를 이번 턴 동안 파워 +1000.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-019]],
    schema_version=1,
  })
end
