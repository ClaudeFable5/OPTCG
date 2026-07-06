-- AUTO-GENERATED: OP12-093 / 몰리
-- rules_id=OP12-093 script_id=880001546 fingerprint=edb9d8f5bf142ce11ea5392ba25270bc2687e2c9dd3d4f47d90ff883876fd7c2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-093]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=4,
            duration=[[WHILE_CONDITION]],
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
            trait=[[혁명군]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 《혁명군》 특징을 가진 경우, 이 캐릭터의 코스트 +4.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-093]],
    schema_version=1,
  })
end
