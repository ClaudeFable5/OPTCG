-- MANUAL: OP17-039 / 록스 D. 지벡 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-039]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              trait_contains=[[록스 해적단]],
            },
            on_match={
              {
                count=2,
                op=[[DRAW]],
                player=[[YOU]],
              },
            },
            op=[[REVEAL_DECK_TOP]],
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
        source_text=[[【어택 시】자신의 패 1장을 버릴 수 있다：자신의 덱 위에서 1장을 공개한다. 공개한 카드가 『록스 해적단』을 포함한 특징을 가진 경우, 카드를 2장 뽑는다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-039]],
    schema_version=1,
  })
end
