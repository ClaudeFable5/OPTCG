-- AUTO-GENERATED: OP11-058 / 몽키 D. 루피
-- rules_id=OP11-058 script_id=880001392 fingerprint=f51750d57c50491b09f51c9a7ab2db555e3cc193c5901b15cd8a32d5d58deb06
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-058]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[CANNOT_ATTACK]],
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
            count=5,
            op=[[HAND_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 패가 5장 이상인 경우, 이 캐릭터는 어택할 수 없다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP11-058]],
    schema_version=1,
  })
end
