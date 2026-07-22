-- AUTO-GENERATED: OP14-012 / 베포
-- rules_id=OP14-012 script_id=880002177 fingerprint=ce922582d536c8517d08a960af79b8e59773f733b6e43f2230e910f8d73f9fad
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-012]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={
          {
            amount=5000,
            op=[[SELF_POWER_GTE]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】이 캐릭터의 파워가 5000 이상인 경우, 자신의 리더 또는 캐릭터 1장에 레스트 상태인 두웅!! 2장까지를 부여한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-012]],
    schema_version=1,
  })
end
