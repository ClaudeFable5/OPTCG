-- MANUAL: OP17-042 / 카이도 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-042]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            amount=-3000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=3,
            filter={
              trait_contains=[[록스 해적단]],
            },
            op=[[REVEAL_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 『록스 해적단』을 포함한 특징을 가진 카드 3장을 공개할 수 있다：상대의 캐릭터 1장까지를 이번 턴 동안 파워 -3000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP17-042]],
    schema_version=1,
  })
end
