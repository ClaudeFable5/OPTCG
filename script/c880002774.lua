-- MANUAL: OP17-068 / 사사키 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-068]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[백수 해적단]],
          },
        },
        costs={
          {
            count=2,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 패 2장을 버릴 수 있다：자신의 리더가 특징 《백수 해적단》을 가진 경우, 두웅!! 덱에서 두웅!!을 2장까지 레스트 상태로 추가한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-068]],
    schema_version=1,
  })
end
