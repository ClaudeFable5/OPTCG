-- AUTO-GENERATED PROMO: P-097 / 샹크스
-- rules_id=P-097 script_id=880002513
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-097]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[PREVENT_BLOCKER_ACTIVATION]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】/【어택 시】이번 턴 동안, 상대는 【블로커】를 발동할 수 없다.]],
        timings={
          [[ON_PLAY]],
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[P-097]],
    schema_version=1,
  })
end
