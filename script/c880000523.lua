-- AUTO-GENERATED: OP04-032 / 베이비 5
-- rules_id=OP04-032 script_id=880000523 fingerprint=af530b5d149b9d087702268dfa7aec0f5fdc0be68eb587a4137afad943e0e879
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-032]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】이 캐릭터를 트래시에 놓을 수 있다: 자신의 두웅!!을 2장까지 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-032]],
    schema_version=1,
  })
end
