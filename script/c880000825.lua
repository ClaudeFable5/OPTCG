-- AUTO-GENERATED: OP06-091 / 빅토리아 신드리
-- rules_id=OP06-091 script_id=880000825 fingerprint=0e39117d754cf8271e1e6cc15b7ba68133b1cba3a46b09c42edb19a476b93bdd
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-091]],
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
        source_text=[[【등장 시】자신의 리더가 《스릴러 바크 해적단》 특징을 가진 경우, 덱 위에서 5장을 트래시에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-091]],
    schema_version=1,
  })
end
