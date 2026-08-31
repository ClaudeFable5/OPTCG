-- MANUAL: ST34-004 / 샬롯 링링 (2026-08-28 6색 스타트덱 ST31~36 추가)
-- JP 공홈 series 550034 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST34-004]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
          {
            duration=[[THIS_TURN]],
            op=[[SET_BASE_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            value=0,
          },
        },
        conditions={},
        costs={
          {
            count=4,
            op=[[RETURN_DON]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!!-4, 자신의 패 1장을 버릴 수 있다：자신의 덱 위에서 1장까지를 라이프 위에 넣는다. 그 후, 상대의 캐릭터 1장까지를 이번 턴 동안 원래 파워 0으로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST34-004]],
    schema_version=1,
  })
end
