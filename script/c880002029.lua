-- AUTO-GENERATED: P-026 / 모건
-- rules_id=P-026 script_id=880002029 fingerprint=e4f01183aee5e003b95f49731ddb7f84cd6073723d3bce13ce9139ba376e502b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-026]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-3,
            duration=[[THIS_TURN]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -3.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[P-026]],
    schema_version=1,
  })
end
