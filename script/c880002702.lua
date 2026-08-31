-- MANUAL: ST36-001 / 캐번디시 (2026-08-28 6색 스타트덱 ST31~36 추가)
-- JP 공홈 series 550036 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST36-001]],
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
        source_text=[[【KO 시】자신의 패 1장을 버릴 수 있다：자신의 덱 위에서 1장까지를 라이프 위에 넣는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[ST36-001]],
    schema_version=1,
  })
end
