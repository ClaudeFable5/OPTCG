-- MANUAL: OP17-111 / 샬롯 몽도르 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-111]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=2,
              filter={
                cost_lte=1,
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
            count=2,
            filter={
              has_trigger=true,
            },
            op=[[REVEAL_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 【트리거】를 가진 카드 2장을 공개할 수 있다：상대의 코스트 1 이하인 캐릭터 2장까지를 KO한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-111]],
    schema_version=1,
  })
end
