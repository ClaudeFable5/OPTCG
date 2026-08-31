-- MANUAL: ST33-002 / 사카즈키 (2026-08-28 6색 스타트덱 ST31~36 추가)
-- JP 공홈 series 550033 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST33-002]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[OPPONENT]],
          },
        },
        conditions={
          {
            count=6,
            op=[[HAND_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 패 1장을 버릴 수 있다：상대의 패가 6장 이상인 경우, 상대는 자신의 패 1장을 버린다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              trait=[[해군]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 패에서 코스트 4 이하인 특징 《해군》을 가진 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[ST33-002]],
    schema_version=1,
  })
end
