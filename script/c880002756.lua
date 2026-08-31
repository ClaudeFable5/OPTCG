-- MANUAL: OP17-050 / 슈트로이젠 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-050]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=2,
            destinations={
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
            op=[[LOOK_REORDER_DECK_TOP]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 2장을 보고, 원하는 순서로 나열해 덱 위나 아래에 놓는다. 그 후, 카드를 1장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-050]],
    schema_version=1,
  })
end
