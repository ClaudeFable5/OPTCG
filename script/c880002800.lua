-- MANUAL: OP17-094 / 로드 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-094]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            amount=12,
            op=[[MODIFY_COST]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[엘바프]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 특징 《엘바프》를 가진 경우, 이 캐릭터의 코스트 +12.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-094]],
    schema_version=1,
  })
end
