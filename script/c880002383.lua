-- AUTO-GENERATED: OP15-081 / 상디
-- rules_id=OP15-081 script_id=880002383 fingerprint=9cc739f9cc23202f2e70821f890b9954830ac94b2fa2b01d97c3a81390dbde7d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-081]],
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
            trait=[[밀짚모자 일당]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《밀짚모자 일당》 특징을 가진 경우, 자신의 덱 위에서 5장을 트래시에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-081]],
    schema_version=1,
  })
end
