-- AUTO-GENERATED: OP15-010 / 네즈미
-- rules_id=OP15-010 script_id=880002312 fingerprint=3dd37e42dbad3b41d5349d4f97363fb3abcf1fa175ea7675cc50c85fc3d67f73
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-010]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
            source=[[OWNER]],
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】리더나 캐릭터 1장에 그 주인의 레스트 상태인 두웅!! 1장까지를 붙인다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-010]],
    schema_version=1,
  })
end
