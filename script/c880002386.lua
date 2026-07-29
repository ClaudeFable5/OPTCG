-- AUTO-GENERATED: OP15-084 / Dr. 호그백
-- rules_id=OP15-084 script_id=880002386 fingerprint=92cef87258e668927a534ae05050f6224f18a6f90d9aee51b98bdabf6658cd7c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-084]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=5,
            op=[[MILL_DECK]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[스릴러 바크 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《스릴러 바크 해적단》 특징을 가진 경우, 자신의 덱 위에서 5장을 트래시에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            count=6,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 패가 6장 이하인 경우, 카드를 1장 뽑는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-084]],
    schema_version=1,
  })
end
