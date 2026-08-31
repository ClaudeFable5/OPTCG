-- MANUAL: ST36-004 / 바르톨로메오 (2026-08-28 6색 스타트덱 ST31~36 추가)
-- JP 공홈 series 550036 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST36-004]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              trait=[[초신성]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 특징 《초신성》을 가진 카드 1장을 버릴 수 있다：카드를 2장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST36-004]],
    schema_version=1,
  })
end
