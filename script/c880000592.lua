-- AUTO-GENERATED: OP04-100 / 카포네 벳지
-- rules_id=OP04-100 script_id=880000592 fingerprint=f547e1506aeb6244e09a05c04852ba23e9ea7c60feed93f83a3bdadb01dcb5fb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-100]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[CANNOT_ATTACK]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이번 턴 동안, 상대의 리더 또는 캐릭터 1장까지는 어택할 수 없다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-100]],
    schema_version=1,
  })
end
