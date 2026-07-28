-- AUTO-GENERATED: OP15-110 / 브라함
-- rules_id=OP15-110 script_id=880002412 fingerprint=490329bb40ec4e45ad98c8ce7ca7b621db267f71b1f769b1528c5b98b0ae66bd
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-110]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[샨도라의 전사]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 리더가 《샨도라의 전사》 특징을 가진 경우, 자신의 덱 위에서 1장까지를 라이프 맨 위에 놓는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-110]],
    schema_version=1,
  })
end
