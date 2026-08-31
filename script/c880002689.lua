-- MANUAL: ST33-003 / 스모커 (2026-08-28 6색 스타트덱 ST31~36 추가)
-- JP 공홈 series 550033 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST33-003]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_DECK_BOTTOM]],
            selector={
              count=2,
              filter={
                cost_lte=2,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패 1장을 버릴 수 있다：상대의 코스트 2 이하인 캐릭터 2장까지를 주인의 덱 아래에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST33-003]],
    schema_version=1,
  })
end
