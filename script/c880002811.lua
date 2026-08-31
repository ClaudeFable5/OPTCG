-- MANUAL: OP17-105 / 샬롯 시폰 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-105]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                has_trigger=true,
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
            filter={
              has_trigger=true,
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 【트리거】를 가진 카드 1장을 버릴 수 있다：상대의 【트리거】를 가진 캐릭터 1장까지를 주인의 패로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-105]],
    schema_version=1,
  })
end
