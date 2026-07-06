-- AUTO-GENERATED: OP11-107 / 촌마게
-- rules_id=OP11-107 script_id=880001441 fingerprint=d27975e60bad93c924b4a6f58e8536235d358bfa91118f48400debb630f3a403
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-107]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            schedule=[[THIS_TURN_END]],
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
            name=[[시라호시]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=1,
            faceup=false,
            op=[[FLIP_LIFE_TOP]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 리더가 「시라호시」인 경우, 자신의 라이프 위에서 1장을 뒷면으로 할 수 있다: 이번 턴 종료 시, 이 캐릭터를 액티브로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP11-107]],
    schema_version=1,
  })
end
