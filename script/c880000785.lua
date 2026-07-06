-- AUTO-GENERATED: OP06-051 / 츠루
-- rules_id=OP06-051 script_id=880000785 fingerprint=44144ab93612ea297c6e1193abeeb5ca4aae5f1851b6620a05a2cdecf49eb522
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-051]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            chooser=[[OPPONENT]],
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=2,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패 2장을 버릴 수 있다: 상대는 자신의 캐릭터 1장을 주인의 패로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-051]],
    schema_version=1,
  })
end
