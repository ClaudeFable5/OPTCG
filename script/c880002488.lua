-- AUTO-GENERATED PROMO: P-037 / 몽키 D. 루피
-- rules_id=P-037 script_id=880002488
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-037]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
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
            count=2,
            filter={
              rested=true,
            },
            op=[[CHARACTER_COUNT_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 레스트 상태인 캐릭터가 2장 이상인 경우, 이번 턴 동안, 이 캐릭터의 파워 +1000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[P-037]],
    schema_version=1,
  })
end
