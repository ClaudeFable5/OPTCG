-- AUTO-GENERATED: OP14-039 / 관선
-- rules_id=OP14-039 script_id=880002204 fingerprint=0c396e624eeb04552d2c09ae7676a719919568cd97dde59aae89bbebcdfc0e3a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-039]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            name=[[쥬라큘 미호크]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 「쥬라큘 미호크」인 경우, 카드를 1장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            name=[[쥬라큘 미호크]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 리더가 「쥬라큘 미호크」인 경우, 자신의 두웅!! 1장까지를 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-039]],
    schema_version=1,
  })
end
