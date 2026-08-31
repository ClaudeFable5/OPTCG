-- MANUAL: OP17-109 / 샬롯 푸딩 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-109]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=3,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              has_trigger=true,
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 【트리거】를 가진 카드 1장을 버릴 수 있다：카드를 3장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-109]],
    schema_version=1,
  })
end
