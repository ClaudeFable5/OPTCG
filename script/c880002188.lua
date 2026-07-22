-- AUTO-GENERATED: OP14-023 / 키쿠노죠
-- rules_id=OP14-023 script_id=880002188 fingerprint=de643983c124dfd45d457c9e8f9802e6db49a5dde6cda40ff3f7b999408d795b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-023]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】이 캐릭터를 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-023]],
    schema_version=1,
  })
end
