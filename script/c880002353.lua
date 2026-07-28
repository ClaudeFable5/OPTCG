-- AUTO-GENERATED: OP15-051 / 몽키 D. 루피
-- rules_id=OP15-051 script_id=880002353 fingerprint=e7ee9b54e7c44ed560198bc6b41e493479800c1e2f512f75c1dffd8a9a7bdc45
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-051]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
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
            trait=[[드레스로자]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】자신의 리더가 《드레스로자》 특징을 가진 경우, 이 캐릭터의 파워 +3000.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-051]],
    schema_version=1,
  })
end
