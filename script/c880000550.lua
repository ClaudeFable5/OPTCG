-- AUTO-GENERATED: OP04-058 / 크로커다일
-- rules_id=OP04-058 script_id=880000550 fingerprint=29425ed1f519477b373d118f090cc0aa20fbfe1a552163197c3f1c99061fa0ec
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-058]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[ACTIVE]],
          },
        },
        conditions={
          {
            op=[[EVENT_CAUSED_BY_OWN_EFFECT]],
          },
          {
            op=[[OPPONENT_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【상대의 턴 동안】【턴 1회】자신 필드의 두웅!!이 자신의 효과에 의해 두웅!! 덱으로 되돌려졌을 때, 두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[ON_DON_RETURNED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-058]],
    schema_version=1,
  })
end
