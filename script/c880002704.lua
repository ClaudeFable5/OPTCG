-- MANUAL: ST36-003 / 스크래치멘 아푸 (2026-08-28 6색 스타트덱 ST31~36 추가)
-- JP 공홈 series 550036 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST36-003]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            duration=[[THIS_TURN]],
            op=[[SET_BASE_POWER]],
            selector={
              count=1,
              filter={
                trait=[[초신성]],
              },
              kind=[[LEADER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
            value=7000,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[카드를 1장 뽑고, 자신의 특징 《초신성》을 가진 리더를 이번 턴 동안 원래 파워 7000으로 한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST36-003]],
    schema_version=1,
  })
end
