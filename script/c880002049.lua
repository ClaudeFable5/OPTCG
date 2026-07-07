-- AUTO-GENERATED: P-055 / 몽키 D. 루피
-- rules_id=P-055 script_id=880002049 fingerprint=82ea465745a0ab7b5a1296f012df8159af5be4ae667fa1d5665d20e02b02be4e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-055]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
            selector={
              chooser=[[OPPONENT]],
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
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
        source_text=[[【등장 시】자신의 패 2장을 버릴 수 있다: 상대는 자신의 캐릭터 1장을 주인의 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[P-055]],
    schema_version=1,
  })
end
