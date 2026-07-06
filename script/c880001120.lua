-- AUTO-GENERATED: OP09-025 / 크로커다일
-- rules_id=OP09-025 script_id=880001120 fingerprint=5fcbbe5cbd83c0cb9f77cb2ee1dbe606c99269ac1231dc6d639e06886192d960
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-025]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            attacker_filter={
              card_type=[[LEADER]],
            },
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_BE_KO]],
            reason=[[BATTLE]],
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
            trait=[[ODYSSEY]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 《ODYSSEY》 특징을 가진 경우, 이 캐릭터는 리더와의 배틀에서는 KO 당하지 않는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-025]],
    schema_version=1,
  })
end
