-- AUTO-GENERATED PROMO: P-100 / 마샬 D. 티치
-- rules_id=P-100 script_id=880002516
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-100]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[NEGATE_EFFECTS]],
            selector={
              count=0,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[ALL]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】이번 턴 동안, 상대의 모든 리더와 캐릭터의 효과를 무효로 한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[P-100]],
    schema_version=1,
  })
end
